import 'package:flutter/material.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/widgets/molecules/breed_cell.dart';

class DogBreedListWidget extends StatelessWidget {
  const DogBreedListWidget({super.key, required this.breeds});

  final List<BreedInfo> breeds;

  @override
  Widget build(BuildContext context) {
      return ListView.separated(
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          final breed = breeds[index];
          return BreedCellWidget(breed: breed);
        }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1, height: 0),
    );
  }
}
