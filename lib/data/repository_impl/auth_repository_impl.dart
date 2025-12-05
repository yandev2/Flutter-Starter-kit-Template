import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/error_class.dart';
import 'package:flutter_app/data/database/source/auth_datasource.dart';
import 'package:flutter_app/domain/entity/auth_entity.dart';
import 'package:flutter_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImpl(this.authDatasource);
  @override
  Future<Either<ErrorClass, AuthEntity>> autoLogin(String authToken) async {
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
}
