import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<BreedDetailsCubit, BreedDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(BlocProvider.of<BreedDetailsCubit>(context).breed?.nameFormatter ?? ''),
          ),
          body: Center(
            child: state.maybeWhen(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (image)=> Image(image: NetworkImage(image)),
              error: (error) => Center(
                child: Text('$error'),
              ),
              orElse: () => const Center(
                child: Text('text'),
              ),
            ),
          ),
        );
      },
    );
  }
}
