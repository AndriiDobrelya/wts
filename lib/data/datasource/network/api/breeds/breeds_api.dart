import 'package:wst/data/datasource/network/api/breeds/breeds_api_interface.dart';
import 'package:wst/data/datasource/network/exchange_models/response.dart';
import 'package:wst/data/datasource/network/exchange_models/request.dart';
import 'package:wst/data/datasource/network/services/network_service/network_service_interface.dart';
import 'package:wst/data/model/breed_details_model.dart';
import 'package:wst/data/model/breeds_model.dart';

class BreedsApi implements IBreedsApi {
  BreedsApi(INetworkService networkService) : _networkService = networkService;

  static const String _apiPath = '/api';
  static const String _breedsPath = '$_apiPath/breeds/list/all';
  static const String _breedPath = '$_apiPath/breed';

  final INetworkService _networkService;

  @override
  Future<NetworkResponse<BreedsModel>> getBreeds() async => await _networkService.request(
        const NetworkRequest(
          method: NetworkRequestType.get,
          path: _breedsPath,
        ),
        onParse: (response) => BreedsModel.fromJson(response.data),
      );

  @override
  Future<NetworkResponse<BreedDetailsModel>> getBreedDetails(
          String breed, String? subBreed) async =>
      await _networkService.request(
        NetworkRequest(
          method: NetworkRequestType.get,
          path: subBreed != null
              ? '$_breedPath/$breed/$subBreed/images/random'
              : '$_breedPath/$breed/images/random',
        ),
        onParse: (response) => BreedDetailsModel.fromJson(response.data),
      );
}
