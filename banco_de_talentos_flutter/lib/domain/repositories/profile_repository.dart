import 'package:fpdart/fpdart.dart';
import '../../core/errors/failures.dart';
import '../entities/profile.dart';
import '../entities/work_experience.dart';
import '../entities/course.dart';
import '../entities/sector.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, void>> updateProfileAvailability(bool isAvailable);
  Future<Either<Failure, void>> updateProfileSectors(List<int> sectorIds);
  Future<Either<Failure, void>> updateProfileDetails(Profile profile);

  Future<Either<Failure, WorkExperience>> addWorkExperience(WorkExperience experience);
  Future<Either<Failure, void>> updateWorkExperience(WorkExperience experience);
  Future<Either<Failure, void>> deleteWorkExperience(String id);

  Future<Either<Failure, Course>> addCourse(Course course, String? localFilePath);
  Future<Either<Failure, void>> updateCourse(Course course, String? localFilePath);
  Future<Either<Failure, void>> deleteCourse(String id);

  Future<Either<Failure, List<Sector>>> getSectors();
  
  Future<Either<Failure, String>> uploadResume(dynamic fileInput);
}
