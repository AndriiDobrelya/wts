import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wst/domain/entities/breed_info.dart';

part 'breed_details_state.dart';

part 'breed_details_cubit.freezed.dart';

class BreedDetailsCubit extends Cubit<BreedDetailsState> {
  BreedDetailsCubit() : super(const BreedDetailsState.initial());

}
