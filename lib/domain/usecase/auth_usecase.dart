import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/error_class.dart';
import 'package:flutter_app/domain/entity/auth_entity.dart';
import 'package:flutter_app/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);

  Future<Either<ErrorClass, AuthEntity>> call(String email, String password) async {
    return authRepository.login(email, password);
  }
}

class AutoLoginUsecase {
  final AuthRepository authRepository;
  AutoLoginUsecase(this.authRepository);

  Future<Either<ErrorClass, AuthEntity>> call(String authToken) async {
    return authRepository.autoLogin(authToken);
  }
}
