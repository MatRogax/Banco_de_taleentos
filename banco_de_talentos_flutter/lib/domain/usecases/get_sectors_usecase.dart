import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/sector.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetSectorsUseCase implements UseCase<List<Sector>, NoParams> {
  final ProfileRepository repository;

  GetSectorsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Sector>>> call(NoParams params) async {
    return await repository.getSectors();
  }
}
