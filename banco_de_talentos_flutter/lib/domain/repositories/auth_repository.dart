import 'package:fpdart/fpdart.dart';
import '../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String fullName,
    required String documentId,
  });

  Future<Either<Failure, void>> signOut();
}
