import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';
import 'package:wst/presentation/breed_details_screen/bloc/breed_details_cubit.dart';
import 'package:wst/presentation/breed_details_screen/breed_details_layout.dart';

@RoutePage()
class BreedDetailsScreen extends StatelessWidget {
  const BreedDetailsScreen({super.key});

  static const path = 'breed_details_screen';

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ISolutionRepository>(context);
    return BlocProvider(
      create: (context) => BreedDetailsCubit(repository: repository),
      child: const BreedDetailsLayout(),
    );
  }
}
