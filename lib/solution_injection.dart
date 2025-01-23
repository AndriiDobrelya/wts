import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wst/configs/app_config.dart';
import 'package:wst/configs/environment/environment_helper.dart';
import 'package:wst/configs/environment/environment_service.dart';
import 'package:wst/configs/environment/environment_variables.dart';
import 'package:wst/core/use_case.dart';
import 'package:wst/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:wst/data/datasource/local/solution_storage.dart';
import 'package:wst/data/datasource/network/api/breeds/breeds_api.dart';
import 'package:wst/data/datasource/network/api/breeds/breeds_api_interface.dart';
import 'package:wst/data/datasource/network/services/network_service/network_service.dart';
import 'package:wst/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:wst/data/repositories/solution_repository.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';
import 'package:wst/domain/use_cases/breeds_use_case.dart';
import 'package:wst/utils/hive_helper.dart';

class SolutionInjection {
  static List<SingleChildWidget> getDiList(BuildContext context) {
    final SolutionInjection injection = SolutionInjection();
    return injection.diFactory(context);
  }

  List<SingleChildWidget> diFactory(BuildContext context) {
    return [
      ..._buildIndependentServices(),
      ..._dependentServices(context),
    ];
  }

  //Feel free to expand this
  List<SingleChildWidget> _buildIndependentServices() {
    return [
      Provider.value(value: AppConfig()),
      Provider.value(value: HiveHelper()),
      Provider.value(value: const FlutterSecureStorage()),
    ];
  }

  List<SingleChildWidget> _dependentServices(BuildContext context) {
    return [
      ProxyProvider<AppConfig, EnvironmentHelper>(
        update: (BuildContext context, AppConfig appConfig, EnvironmentHelper? greetingService) => EnvironmentHelper(
          appConfig: appConfig,
          environmentValue: EnvironmentVariables.environmentValue,
        ),
      ),

      ProxyProvider2<AppConfig, EnvironmentHelper, EnvironmentService>(
        update: (
          BuildContext context,
          AppConfig appConfig,
          EnvironmentHelper envHelper,
          EnvironmentService? greetingService,
        ) =>
            EnvironmentService(
          environment: envHelper.currentEnvironment(),
          appConfig: appConfig,
        ),
      ),

      ProxyProvider2<EnvironmentService, HiveHelper, ISolutionStorage>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          HiveHelper hiveHelper,
          ISolutionStorage? configurationStore,
        ) {
          final HiveInterface hive = Hive;
          return SolutionStorage(
            hive: hive,
            boxPrefix: environmentService.config.hiveBoxPrefix,
            hiveHelper: hiveHelper,
          );
        },
      ),

      ProxyProvider<AppConfig, EnvironmentHelper>(
        update: (BuildContext context, AppConfig appConfig, EnvironmentHelper? greetingService) => EnvironmentHelper(
          appConfig: appConfig,
          environmentValue: EnvironmentVariables.environmentValue,
        ),
      ),

      ProxyProvider<EnvironmentService, INetworkService>(
        update: (
          BuildContext context,
          EnvironmentService environmentService,
          INetworkService? networkService,
        ) {
          final interceptors = [LogInterceptor()];
          return NetworkService(baseUrl: environmentService.config.portalUrl, interceptors: interceptors);
        },
      ),

      //Domain services
      ProxyProvider<INetworkService, IBreedsApi>(
        update: (BuildContext context, INetworkService networkService, IBreedsApi? breedsApi) =>
            BreedsApi(networkService),
      ),

      ProxyProvider2<IBreedsApi, ISolutionStorage, ISolutionRepository>(
        update: (BuildContext context, IBreedsApi breedsApi, ISolutionStorage storage,
                ISolutionRepository? breedsRepository) =>
            SolutionRepository(
          api: breedsApi,
          storage: storage,
        ),
      ),

      ProxyProvider<ISolutionRepository, BreedsUseCase>(
        update: (
          BuildContext context,
          ISolutionRepository breedsRepository,
          UseCase? breedsUseCase,
        ) =>
            BreedsUseCase(breedsRepository),
      ),
    ];
  }
}
