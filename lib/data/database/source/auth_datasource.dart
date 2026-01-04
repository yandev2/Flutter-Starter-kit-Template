import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../service/api/api.dart';
import '../../model/auth_model.dart';

abstract class AuthDatasource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> register(String email, String password, String? username);
  Future<AuthModel> autoLogin(String? authToken);
}

class AuthDatasourceImpl implements AuthDatasource {
  var statusCode = 0;

  @override
  Future<AuthModel> autoLogin(String? authToken) async {
    try {
      final url = Uri.parse('$api/user/autologin');
      final response = await http.post(
        url,
        headers: {"Authorization": "Bearer $authToken", "Accept": "application/json"},
      );
      statusCode = response.statusCode;
      if (statusCode != 200) {
        throw Exception(statusCode);
      } else {
        final data = json.decode(response.body);
        if (data['success'] == false) {
          throw Exception(data['message']);
        } else {
          return AuthModel.fromJson(data['data']);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final url = Uri.parse('$api/user/login');
      final response = await http.post(url, body: {'email': email, 'password': password});

      statusCode = response.statusCode;
      if (statusCode != 200) {
        throw Exception(statusCode);
      } else {
        final data = json.decode(response.body);
        if (data['success'] == false) {
          throw Exception(data['message']);
        } else {
          return AuthModel.fromJson(data['data']);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthModel> register(String email, String password, String? username) async {
    try {
      final url = Uri.parse('$api/user/register');
      final response = await http.post(
        url,
        body: {'email': email, 'password': password, 'username': username},
      );

      statusCode = response.statusCode;
      if (statusCode != 200) {
        throw Exception(statusCode);
      } else {
        final data = json.decode(response.body);
        if (data['success'] == false) {
          throw Exception(data['message']);
        } else {
          return AuthModel.fromJson(data['data']);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
