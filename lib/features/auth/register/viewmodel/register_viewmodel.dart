import 'package:flutter/material.dart';
import 'package:todolist/data/repositories/auth_services.dart';
import 'package:todolist/features/auth/register/models/request_register.dart';
import 'package:todolist/features/auth/register/models/response_register.dart';

class RegisterViewModel extends ChangeNotifier {
  final service = AuthServices();

  Future<ResponseRegister?> regis(BuildContext context, RequestRegister payload) async {
    final result = await service.registration(context, payload: payload);
    if (result != null) {
      return result;
    }
    return null;
  }
}
