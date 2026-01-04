import 'package:dartz/dartz.dart';
import '../../core/error/exception_class.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../database/source/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImpl(this.authDatasource);
  @override
  Future<Either<ErrorClass, AuthEntity>> autoLogin(String? authToken) async {
    try {
      final result = await authDatasource.autoLogin(authToken);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ErrorClass(statusCode: 404, msg: e.toString()));
    }
  }

  @override
  Future<Either<ErrorClass, AuthEntity>> login(String email, String password) async {
    try {
      final result = await authDatasource.login(email, password);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ErrorClass(statusCode: 404, msg: e.toString()));
    }
  }

  @override
  Future<Either<ErrorClass, AuthEntity>> register(
    String email,
    String password,
    String? username,
  ) async {
    try {
      final result = await authDatasource.register(email, password, username);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ErrorClass(statusCode: 404, msg: e.toString()));
    }
  }
}
