
import 'package:get/get.dart';

import '../../data/database/source/auth_datasource.dart';
import '../../data/repository_impl/auth_repository_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../api/database_service.dart';

class DependencyInjectionController extends GetxController {
  late AuthDatasource authDatasource;
  late AuthRepository authRepository;
  late LoginUsecase loginUsecase;
  late RegisterUsecase registerUsecase;
  late AutoLoginUsecase autoLoginUsecase;

  DatabaseService databaseService = DatabaseService();
 // PreferenceService preferenceService = PreferenceService();

  @override
  void onInit() async {
    await databaseService.databaseMain();
    authDatasource = AuthDatasourceImpl();
    authRepository = AuthRepositoryImpl(authDatasource);
    loginUsecase = LoginUsecase(authRepository);
    registerUsecase = RegisterUsecase(authRepository);
    autoLoginUsecase = AutoLoginUsecase(authRepository);

    super.onInit();
  }
}
