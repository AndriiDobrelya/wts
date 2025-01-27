import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/generated/assets/assets.gen.dart';
import 'package:wst/navigation/app_router.dart';
import 'package:wst/presentation/breed_details_screen/breed_details_screen.dart';
import 'package:wst/presentation/breeds_screen/bloc/breeds_bloc.dart';

class BreedCellWidget extends StatelessWidget {
  const BreedCellWidget({super.key, required this.breed});

  final BreedInfo breed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<BreedsBloc>().addBreed(breed);
        context.router.push(const BreedDetailsRoute());
      },
      child: ListTile(
        title: Row(
          children: [
            Assets.images.icons.logo.image(width: 15, height: 15),
            const SizedBox(width: 15),
            Text(breed.nameFormatter),
          ],
        ),
      ),
    );
  }
}
