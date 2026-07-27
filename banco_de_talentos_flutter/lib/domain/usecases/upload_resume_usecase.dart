import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UploadResumeUseCase implements UseCase<String, dynamic> {
  final ProfileRepository repository;

  UploadResumeUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(dynamic fileInput) async {
    return await repository.uploadResume(fileInput);
  }
}
