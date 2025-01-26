import 'package:wst/core/use_case.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/domain/use_cases/breeds_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'breeds_event.dart';

part 'breeds_state.dart';

part 'breeds_bloc.freezed.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  BreedsBloc(this._useCase) : super(const BreedsState.initial()) {
    List<BreedInfo> breeds = [];
    on<BreedsEvent>((event, emit) async {
      if (state == const BreedsState.initial()) {
        emit(const BreedsState.loading());
        final results = await _useCase.execute(NoParams());
        results.when(
          success: (data) {
            breeds = data.breedList;
            emit(BreedsState.loaded(fetchedDogs: breeds));
          },
          error: (error) => emit(BreedsState.error(exception: error)),
        );
      }
    });
  }

  final BreedsUseCase _useCase;
}
