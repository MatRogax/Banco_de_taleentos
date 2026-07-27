import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/work_experience.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class AddWorkExperienceUseCase implements UseCase<WorkExperience, WorkExperience> {
  final ProfileRepository repository;

  AddWorkExperienceUseCase(this.repository);

  @override
  Future<Either<Failure, WorkExperience>> call(WorkExperience experience) async {
    return await repository.addWorkExperience(experience);
  }
}

@lazySingleton
class UpdateWorkExperienceUseCase implements UseCase<void, WorkExperience> {
  final ProfileRepository repository;

  UpdateWorkExperienceUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(WorkExperience experience) async {
    return await repository.updateWorkExperience(experience);
  }
}

@lazySingleton
class DeleteWorkExperienceUseCase implements UseCase<void, String> {
  final ProfileRepository repository;

  DeleteWorkExperienceUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteWorkExperience(id);
  }
}
