import 'package:flutter/material.dart';
import 'package:todolist/application/constant/iconstant.dart';
import 'package:todolist/application/helper/shared_pref.dart';
import 'package:todolist/data/repositories/auth_services.dart';
import 'package:todolist/features/auth/login/models/request_login.dart';
import 'package:todolist/features/auth/login/models/response_login.dart';

class LoginViewModel extends ChangeNotifier {
  final service = AuthServices();

  Future<ResponseLogin?> login(BuildContext context, RequestLogin payload) async {
    final result = await service.login(context, payload: payload);
    if (result != null) {
      await SharedPref.setValue(IConstant.localStorageToken, result.accessToken);
      return result;
    }
    return null;
  }
}
