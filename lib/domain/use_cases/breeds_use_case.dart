import 'package:wst/core/use_case.dart';
import 'package:wst/domain/entities/breeds.dart';
import 'package:wst/domain/entities/result.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';

class BreedsUseCase implements UseCase<Result<Breeds>, NoParams> {
  BreedsUseCase(this.repository);

  final ISolutionRepository repository;

  @override
  Future<Result<Breeds>> execute(NoParams noParams) async => await repository.fetchBreeds();
}
