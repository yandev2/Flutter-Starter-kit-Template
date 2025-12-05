import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final isLoading = false.obs;
  Future autoLogin(String authToken) async {}
  Future login(String? email, String? password) async {}
}
