import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UpdateProfileDetailsUseCase implements UseCase<void, Profile> {
  final ProfileRepository repository;

  UpdateProfileDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(Profile profile) async {
    return await repository.updateProfileDetails(profile);
  }
}
