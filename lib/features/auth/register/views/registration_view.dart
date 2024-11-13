import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todolist/application/components/button/ibutton.dart';
import 'package:todolist/application/components/dialog/idialog_view.dart';
import 'package:todolist/application/components/image/iimage.dart';
import 'package:todolist/application/components/text_form/itext_form.dart';
import 'package:todolist/application/constant/iconstant.dart';
import 'package:todolist/application/helper/size_config.dart';
import 'package:todolist/features/auth/login/views/login_view.dart';
import 'package:todolist/features/auth/register/models/request_register.dart';
import 'package:todolist/features/auth/register/viewmodel/register_viewmodel.dart';

class RegistrationView extends StatelessWidget {
  static const routeName = '/RegistrationView';

  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController ctrlEmail = TextEditingController();
    TextEditingController ctrlUsername = TextEditingController();
    TextEditingController ctrlPassword = TextEditingController();
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.kDefaultPadding * 1,
                  ),
                  child: IImage(
                    image: '${IConstant.pathImg}Logo.png',
                    width: SizeConfig.screenWidth * .25,
                  ),
                ),
                ITextForm(
                  label: 'Email',
                  ctrl: ctrlEmail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email is required';
                    }
                    return null;
                  },
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
                Consumer<RegisterViewModel>(builder: (context, provider, child) {
                  return IButton(
                    name: 'Daftar',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        RequestRegister payload = RequestRegister(
                          username: ctrlUsername.text,
                          password: ctrlPassword.text,
                          email: ctrlEmail.text,
                        );
                        provider.regis(context, payload).then((value) {
                          if (value != null) {
                            IDialogView.dialogSuccess(
                              context,
                              title: "Selamat",
                              desc: 'Sukses Registrasi',
                              onPressedOk: () {
                                context.push(LoginView.routeName);
                              },
                            );
                            ctrlEmail.dispose();
                            ctrlUsername.dispose();
                            ctrlPassword.dispose();
                          }
                        });
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
