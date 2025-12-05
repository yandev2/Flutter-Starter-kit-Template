import 'package:flutter_app/data/database/source/auth_datasource.dart';
import 'package:flutter_app/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_app/domain/entity/auth_entity.dart';
import 'package:flutter_app/domain/repository/auth_repository.dart';
import 'package:flutter_app/domain/usecase/auth_usecase.dart';
import 'package:get/get.dart';

class DependencyInjection extends GetxController {
  late AuthDatasource authDatasource;
  late AuthRepository authRepository;
  late LoginUsecase loginUsecase;
  late AutoLoginUsecase autoLoginUsecase;

  @override
  void onInit() {
    authDatasource = AuthDatasourceImpl();
    authRepository = AuthRepositoryImpl(authDatasource);
    loginUsecase = LoginUsecase(authRepository);
    autoLoginUsecase = AutoLoginUsecase(authRepository);
    super.onInit();
  }

  final user = AuthEntity().obs;
}
