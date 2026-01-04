import '../../core/error/exception_class.dart';
import '../entity/auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<ErrorClass, AuthEntity>> login(String email, String password);
  Future<Either<ErrorClass, AuthEntity>> register(String email, String password, String? username);
  Future<Either<ErrorClass, AuthEntity>> autoLogin(String? authToken);
}
