part of 'breed_details_cubit.dart';

@freezed
class BreedDetailsState with _$BreedDetailsState {
  const factory BreedDetailsState.initial() = InitialBreedDetailsState;

  const factory BreedDetailsState.loaded() = LoadedBreedDetailsState;

  const factory BreedDetailsState.error({final Object? exception}) = ErrorBreedDetailsState;
}