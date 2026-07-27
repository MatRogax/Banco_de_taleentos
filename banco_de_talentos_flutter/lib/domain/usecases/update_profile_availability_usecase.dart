import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UpdateProfileAvailabilityUseCase implements UseCase<void, bool> {
  final ProfileRepository repository;

  UpdateProfileAvailabilityUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(bool isAvailable) async {
    return await repository.updateProfileAvailability(isAvailable);
  }
}
