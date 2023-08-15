import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/login_pages/forgot_password/forget_password_view.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/login_pages/register/register_view.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';
import 'package:medicalapp2/presention/resource/string_manger.dart';
import 'package:medicalapp2/presention/resource/values_manger.dart';

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
  var controller = TextEditingController(text: "");
  var controller1 = TextEditingController(text: "");
  var iconpassword = Icons.remove_red_eye_rounded;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                    padding: EdgeInsets.only(left: 15),
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
                                  child: Text(e),
                                  value: e,
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
                      if (value!.isEmpty && value.length < 8) {
                        return "enter your email";
                      }
                      return null;
                    },
                    controller: controller,
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
                    controller: controller1,
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
                  Methodes.elevetedButton(
                      context, StringManger.Login, MainView(), globalKey),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Methodes.buildTextButton(
                          context,
                          StringManger.Forgotpassword,
                          ForgotPasswordView()),
                      Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p8),
                        child: Row(
                          children: [
                            Text(
                              StringManger.logintitle,
                              style: Methodes.buildTextStyle(),
                            ),
                            Methodes.buildTextButton(context,
                                StringManger.signup, RegisterView()),
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
      ),
    );
  }

//buildInputDecortion
}
