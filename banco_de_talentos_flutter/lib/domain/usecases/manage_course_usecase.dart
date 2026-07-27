import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/course.dart';
import '../repositories/profile_repository.dart';

class CourseParams {
  final Course course;
  final String? localFilePath;

  CourseParams({required this.course, this.localFilePath});
}

@lazySingleton
class AddCourseUseCase implements UseCase<Course, CourseParams> {
  final ProfileRepository repository;

  AddCourseUseCase(this.repository);

  @override
  Future<Either<Failure, Course>> call(CourseParams params) async {
    return await repository.addCourse(params.course, params.localFilePath);
  }
}

@lazySingleton
class UpdateCourseUseCase implements UseCase<void, CourseParams> {
  final ProfileRepository repository;

  UpdateCourseUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CourseParams params) async {
    return await repository.updateCourse(params.course, params.localFilePath);
  }
}

@lazySingleton
class DeleteCourseUseCase implements UseCase<void, String> {
  final ProfileRepository repository;

  DeleteCourseUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteCourse(id);
  }
}
