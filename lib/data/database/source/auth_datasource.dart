import 'dart:convert';

import 'package:flutter_app/data/model/auth_model.dart';
import 'package:flutter_app/service/api/api.dart';
import 'package:http/http.dart' as http;

abstract class AuthDatasource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> autoLogin(String authToken);
}

class AuthDatasourceImpl implements AuthDatasource {
  var statusCode = 0;

  @override
  Future<AuthModel> autoLogin(String authToken) async {
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
}
