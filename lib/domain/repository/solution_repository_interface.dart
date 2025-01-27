import 'package:wst/data/model/breed_details_model.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/domain/entities/breeds.dart';
import 'package:wst/domain/entities/result.dart';

abstract interface class ISolutionRepository {
  Future<Result<Breeds>> fetchBreeds();

  Future<Result<BreedDetailsModel>> getBreedDetails(String breed, String? subBreed);

  Future<Result<void>> saveLocale(String language);

  Future<String?> getLocale();

  void addBreed(BreedInfo breed);

  BreedInfo? getBreed();

}
