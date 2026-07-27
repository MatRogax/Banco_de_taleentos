import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UpdateProfileSectorsUseCase implements UseCase<void, List<int>> {
  final ProfileRepository repository;

  UpdateProfileSectorsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(List<int> sectorIds) async {
    return await repository.updateProfileSectors(sectorIds);
  }
}
