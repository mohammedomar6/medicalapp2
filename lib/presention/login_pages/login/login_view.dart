import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalapp2/app/validation.dart';
import 'package:medicalapp2/domin/auth_repository.dart';
import 'package:medicalapp2/presention/Doctor/DoctorScrren.dart';
import 'package:medicalapp2/presention/login_pages/cubit/auth_cubit.dart';
import 'package:medicalapp2/presention/login_pages/forgot_password/forget_password_view.dart';
import 'package:medicalapp2/presention/login_pages/register/register_view.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/string_manger.dart';
import 'package:medicalapp2/presention/resource/values_manger.dart';

import '../../../app/toaster.dart';
import '../../../methodes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool x = true;
  String? valdrop = "Doctor";
  List<String> list = ["Doctor", "Public"];
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var iconpassword = Icons.remove_red_eye_rounded;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AuthCubit cubit = AuthCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.status == AuthStatus.loading) {
            Toaster.showLoading();
          } else if (state.status == AuthStatus.success ||
              state.status == AuthStatus.failed) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return const MainView();
              },
            ), (route) => false);
            Toaster.closeLoading();
          }
        },
        builder: (context, state) {
          return Form(
            key: globalKey,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: AppPadding.p18),
                height: AppSize.infinty,
                color: ColorManger.background,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      SizedBox(
                        height: 150,
                        width: 340,
                        child: Image.asset(
                          ImageManger.login,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Text(
                        StringManger.Login,
                        style: TextStyle(
                            letterSpacing: 7,
                            fontSize: AppSize.s24,
                            color: ColorManger.textcolor,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: DropdownButtonFormField<String>(

                            dropdownColor: ColorManger.cyen50,

                            decoration: Methodes.buildInputDecoration(
                                "Account Type", "", null, null),
                            style: TextStyle(
                              color: ColorManger.textcolor,
                              fontSize: 16,
                            ),
                            value: valdrop,
                            items: list
                                .map((e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (String? val) {
                              setState(() {
                                valdrop = val!;
                              });
                            }),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null && !value.isValidEmail()) {
                            return "enter your email";
                          }
                          return null;
                        },
                        controller: emailController,
                        style: TextStyle(
                          color: ColorManger.textcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: Methodes.buildInputDecoration(
                            StringManger.Email,
                            StringManger.hintlogin,
                            Icon(
                              Icons.email_outlined,
                              color: ColorManger.textcolor,
                            ),
                            null),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          if (val!.length < 8) {
                            return "enter password length big 8";
                          }
                          return null;
                        },
                        controller: passwordController,
                        style: TextStyle(
                          color: ColorManger.textcolor,
                          fontWeight: FontWeight.w500,
                        ),
                        obscureText: x,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: Methodes.buildInputDecoration(
                            StringManger.Password,
                            StringManger.hintPassword,
                            Icon(
                              Icons.key_outlined,
                              color: ColorManger.textcolor,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (x) {
                                    iconpassword = Icons.key_off;
                                    x = false;
                                  } else {
                                    iconpassword = Icons.remove_red_eye_rounded;
                                    x = true;
                                  }
                                });
                              },
                              icon: Icon(iconpassword),
                              color: ColorManger.textcolor,
                            )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(gradient: ColorManger.y),
                    child: TextButton(
                      child: Text(
                        StringManger.Login,
                        style: TextStyle(color: ColorManger.cyen50, fontSize: 20),
                      ),
                      onPressed: () {
                        if (!(globalKey.currentState!.validate())) {
                          return;
                        }
                      /*  cubit.login(LoginParams(
                            email: emailController.text,
                            password: passwordController.text));*/
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => valdrop=='Public'?MainView():DoctorScreen()),
                        );

                      },
                    ),
                  ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Methodes.buildTextButton(
                              context,
                              StringManger.Forgotpassword,
                              const ForgotPasswordView()),
                          Padding(
                            padding: const EdgeInsets.only(left: AppPadding.p8),
                            child: Row(
                              children: [
                                Text(
                                  StringManger.logintitle,
                                  style: Methodes.buildTextStyle(),
                                ),
                                Methodes.buildTextButton(context,
                                    StringManger.signup, const RegisterView()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//buildInputDecortion
}
