import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/application/components/image/iimage.dart';
import 'package:todolist/application/constant/iconstant.dart';
import 'package:todolist/features/auth/login/views/login_view.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.push(LoginView.routeName);
      },
    );
    return const Scaffold(
      body: Center(
        child: IImage(image: '${IConstant.pathImg}Logo.png'),
      ),
    );
  }
}
