import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todolist/application/components/button/ibutton.dart';
import 'package:todolist/application/components/image/iimage.dart';
import 'package:todolist/application/components/text_form/itext_form.dart';
import 'package:todolist/application/constant/color_palette.dart';
import 'package:todolist/application/constant/iconstant.dart';
import 'package:todolist/application/helper/size_config.dart';
import 'package:todolist/features/auth/login/models/request_login.dart';
import 'package:todolist/features/auth/login/viewmodel/login_viewmodel.dart';
import 'package:todolist/features/auth/register/views/registration_view.dart';
import 'package:todolist/features/home/views/checklist_view.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/LoginView';

  const LoginView({super.key});

  Future _dialogConfirmExit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Tutup Aplikasi'),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'Keluar',
                style: TextStyle(color: ColorPalette.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController ctrlUsername = TextEditingController();
    TextEditingController ctrlPassword = TextEditingController();
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          _dialogConfirmExit(context);
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: SizeConfig.kDefaultPadding * 10,
              left: SizeConfig.kDefaultPadding * 3,
              right: SizeConfig.kDefaultPadding * 3,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.kDefaultPadding * 5,
                    ),
                    child: IImage(
                      image: '${IConstant.pathImg}Logo.png',
                      width: SizeConfig.screenWidth * .25,
                    ),
                  ),
                  ITextForm(
                    label: 'Username',
                    ctrl: ctrlUsername,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'username is required';
                      }
                      return null;
                    },
                  ),
                  ITextForm(
                    label: 'Password',
                    ctrl: ctrlPassword,
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.kDefaultPadding * 2),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password is required';
                      }
                      return null;
                    },
                  ),
                  Consumer<LoginViewModel>(builder: (context, provider, child) {
                    return IButton(
                      name: 'Login',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          RequestLogin payload = RequestLogin(username: ctrlUsername.text, password: ctrlPassword.text);
                          provider.login(context, payload).then((value) {
                            if (value != null) {
                              context.pushReplacement(CheckListView.routeName);
                              ctrlUsername.dispose();
                              ctrlPassword.dispose();
                            }
                          });
                        }
                      },
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('belum punya akun? registrasi '),
                      GestureDetector(
                          onTap: () {
                            context.push(RegistrationView.routeName);
                          },
                          child: const Text(
                            'di sini',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
