import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_boilerplate/application/components/image/iimage.dart';
import 'package:mobile_boilerplate/application/constant/iconstant.dart';
import 'package:mobile_boilerplate/features/auth/login/views/login_view.dart';

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
