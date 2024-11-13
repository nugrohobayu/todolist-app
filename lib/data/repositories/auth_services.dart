import 'package:flutter/material.dart';
import 'package:todolist/data/base_api/base_api.dart';
import 'package:todolist/features/auth/login/models/request_login.dart';
import 'package:todolist/features/auth/login/models/response_login.dart';
import 'package:todolist/features/auth/register/models/request_register.dart';
import 'package:todolist/features/auth/register/models/response_register.dart';

class AuthServices extends BaseApi {
  Future<ResponseLogin?> login(
    BuildContext context, {
    String path = '/api/login',
    required RequestLogin payload,
  }) async {
    final res = await post(
      context,
      path,
      payload.toJson(),
      token: false,
    );
    if (res != null) {
      ResponseLogin result = ResponseLogin.fromJson(res);
      return result;
    }
    return null;
  }

  Future<ResponseRegister?> registration(
    BuildContext context, {
    String path = '/api/register',
    required RequestRegister payload,
  }) async {
    final res = await post(
      context,
      path,
      payload.toJson(),
      token: false,
    );
    if (res != null) {
      ResponseRegister result = ResponseRegister.fromJson(res);
      return result;
    }
    return null;
  }
}
