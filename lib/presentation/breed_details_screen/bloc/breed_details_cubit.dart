import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';

part 'breed_details_state.dart';

part 'breed_details_cubit.freezed.dart';

class BreedDetailsCubit extends Cubit<BreedDetailsState> {
  BreedDetailsCubit({required this.repository}) : super(const BreedDetailsState.initial()) {
    breed = repository.getBreed();
    if (breed == null) {
      emit(const BreedDetailsState.error());
    } else {
      load();
    }
  }

  Future<void> load() async {
    final results = await repository.getBreedDetails(breed!.breed, breed!.subBreed);
    results.when(
      success: (data) {
        if (data.message != null) {
          emit(BreedDetailsState.loaded(imageUrl: data.message!));
        } else {
          emit(const BreedDetailsState.error());
        }
      },
      error: (error) => emit(BreedDetailsState.error(exception: error)),
    );
  }

  late final BreedInfo? breed;
  final ISolutionRepository repository;
}
