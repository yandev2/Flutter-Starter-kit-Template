import 'package:dartz/dartz.dart';

import '../../core/error/exception_class.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

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

  Future<Either<ErrorClass, AuthEntity>> call(

    String authToken,
  ) async {
    return authRepository.autoLogin(authToken);
  }
}

class RegisterUsecase {
  final AuthRepository authRepository;
  RegisterUsecase(this.authRepository);

  Future<Either<ErrorClass, AuthEntity>> call(
    String email,
    String password,
    String username,
  ) async {
    return authRepository.register(email, password, username);
  }
}
