
import '../../../service/api/database_service.dart';
import '../../model/auth_model.dart';

abstract class AuthLocalsource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> register(String email, String password, String? username);
  Future<AuthModel> autoLogin(String? authToken);
}

class AuthLocalsourceImpl implements AuthLocalsource {
  final DatabaseService databaseService = DatabaseService();
  @override
  Future<AuthModel> autoLogin(String? authToken) async {
    try {
      throw Exception();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      throw Exception();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthModel> register(String email, String password, String? username) async {
    try {
      throw Exception();
    } catch (e) {
      throw Exception(e);
    }
  }
}
