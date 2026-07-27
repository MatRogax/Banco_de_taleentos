import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/supabase_error_parser.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/supabase_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final SupabaseDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await datasource.signIn(
        email: email,
        password: password,
      );
      
      final sbUser = response.user;
      if (sbUser == null) {
        return const Left(ServerFailure('Falha ao fazer login: Usuário não retornado'));
      }

      return Right(User(
        id: sbUser.id,
        email: sbUser.email ?? '',
        fullName: sbUser.userMetadata?['full_name'],
        documentId: sbUser.userMetadata?['document_id'],
      ));
    } on sb.AuthException catch (e) {
      return Left(ServerFailure(SupabaseErrorParser.parse(e)));
    } catch (e) {
      return Left(ServerFailure(SupabaseErrorParser.parse(e)));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String fullName,
    required String documentId,
  }) async {
    try {
      final cleanCpf = documentId.replaceAll(RegExp(r'\D'), '');
      final response = await datasource.signUp(
        email: email,
        password: password,
        fullName: fullName,
        documentId: cleanCpf,
      );

      final sbUser = response.user;
      if (sbUser == null) {
        return const Left(ServerFailure('Falha ao registrar: Usuário não retornado'));
      }

      return Right(User(
        id: sbUser.id,
        email: sbUser.email ?? '',
        fullName: sbUser.userMetadata?['full_name'],
        documentId: sbUser.userMetadata?['document_id'],
      ));
    } on sb.AuthException catch (e) {
      return Left(ServerFailure(SupabaseErrorParser.parse(e)));
    } catch (e) {
      return Left(ServerFailure(SupabaseErrorParser.parse(e)));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await datasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(SupabaseErrorParser.parse(e)));
    }
  }
}
