import 'package:wst/domain/entities/result.dart';

abstract interface class ISolutionStorage {
  Future<Result<void>> saveLocale(String language);

  Future<String?> getLocale();
}
