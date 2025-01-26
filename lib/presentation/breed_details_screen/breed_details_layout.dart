import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/generated/l10n.dart';
import 'package:wst/presentation/breed_details_screen/bloc/breed_details_cubit.dart';

class BreedDetailsLayout extends StatefulWidget {
  const BreedDetailsLayout({super.key});

  @override
  State<BreedDetailsLayout> createState() => _BreedDetailsLayoutState();
}

class _BreedDetailsLayoutState extends State<BreedDetailsLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).breed_list),
      ),
      body: Center(
        child: BlocBuilder<BreedDetailsCubit, BreedDetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: ()=> const Text('Text'),
              error: (error) => Center(
                child: Text('$error'),
              ),
              orElse: () => const Center(
                child: Text('text'),
              ),
            );
          },
        ),
      ),
    );
  }
}
