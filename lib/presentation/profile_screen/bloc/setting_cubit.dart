import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';

part 'setting_state.dart';

part 'setting_cubit.freezed.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({required this.configurationRepository}) : super(const SettingState.initial());

  void saveLocaleConfig(String language) async {
    final result = await configurationRepository.saveLocale(language);
    result.maybeWhen(
      success: (data) {
        const SettingState.successfullySavingState();
      },
      error: (data) {
        const SettingState.errorSavingState();
      },
      orElse: SettingState.errorSavingState,
    );
  }

  final ISolutionRepository configurationRepository;
}
