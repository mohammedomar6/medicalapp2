import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/login_pages/login/login_view.dart';
import 'package:medicalapp2/presention/login_pages/verifaction/VarifictionView.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/string_manger.dart';
import 'package:medicalapp2/presention/resource/values_manger.dart';

import '../../resource/routes_manger.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController controller = TextEditingController(text: "");
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methodes.buildAppBar(
          context: context,
          title: StringManger.Forgotpassword,
          routeleading: Routes.loginRoutes),
      body: Form(
        key: globalKey,
        child: Container(
          height: double.infinity,
          color: ColorManger.background,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: AppPadding.p8),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    ImageManger.ForgotPassword,
                    width: 175,
                    alignment: Alignment.center,
                  ),
                ),
                TextFormField(
                  validator: (vlue) {
                    if (vlue!.isEmpty || vlue.isEmpty) {
                      return "Enter your Email";
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
                  height: 50,
                ),
                Methodes.elevetedButton(
                    context, StringManger.send, Verfiction(), globalKey, () {}),
                Align(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 3.5,
                  child: Methodes.buildTextButton(
                      context, StringManger.BacktoSignin, const LoginView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
