import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/error_class.dart';
import 'package:flutter_app/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<ErrorClass, AuthEntity>> login(String email, String password);
  Future<Either<ErrorClass, AuthEntity>> autoLogin(String authToken);
}
