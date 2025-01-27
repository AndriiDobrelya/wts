import 'package:wst/data/datasource/local/facade/solution_storage_interface.dart';
import 'package:wst/data/datasource/network/api/breeds/breeds_api_interface.dart';
import 'package:wst/data/model/breed_details_model.dart';
import 'package:wst/data/model/breeds_model.dart';
import 'package:wst/domain/entities/breed_info.dart';
import 'package:wst/domain/entities/breeds.dart';
import 'package:wst/domain/entities/result.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';

class SolutionRepository implements ISolutionRepository {
  SolutionRepository({
    required IBreedsApi api,
    required ISolutionStorage storage,
  })  : _api = api,
        _storage = storage;

  final IBreedsApi _api;

  final ISolutionStorage _storage;

  BreedInfo? breed;


  @override
  Future<Result<Breeds>> fetchBreeds() async {
    final result = await _api.getBreeds();
    return result.when(onSuccess: Result<BreedsModel>.success, onError: Result.error);
  }

  @override
  Future<String?> getLocale() => _storage.getLocale();

  @override
  Future<Result<void>> saveLocale(String language) => _storage.saveLocale(language);

  @override
  void addBreed(BreedInfo breed) {
    this.breed = breed;
  }

  @override
  BreedInfo? getBreed() {
    return breed;
  }

  @override
  Future<Result<BreedDetailsModel>> getBreedDetails(String breed, String? subBreed) async {
    final result = await _api.getBreedDetails( breed,  subBreed);
    return result.when(onSuccess: Result<BreedDetailsModel>.success, onError: Result.error);
  }
}
