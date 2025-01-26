import 'package:wst/domain/entities/breeds.dart';
import 'package:wst/domain/entities/result.dart';

abstract interface class ISolutionRepository {
  Future<Result<Breeds>> fetchBreeds();

  Future<Result<void>> saveLocale(String language);

  Future<String?> getLocale();

}
