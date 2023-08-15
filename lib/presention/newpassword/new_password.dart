import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/login/login_view.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';
import 'package:medicalapp2/presention/resource/string_manger.dart';
import 'package:medicalapp2/presention/verifaction/VarifictionView.dart';
class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 0,
          title: Text(
            "New Password",
            style: TextStyle(
              color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(187, 227, 227, 0.7333333333333333),
            automaticallyImplyLeading: false,

        ),
        body: Form(
          key: globalKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorManger.background,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 30),
                    //   color: ColorManger.background,
                    width: 200,

                    height: 200,
                    child: Image.asset(

                      color: ColorManger.textcolor,
                      ImageManger.newpassword,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val){
                     if( val!.isEmpty && val.length==0)
                       return "enter correct email";
                    },
                    obscureText: true,
                    decoration: Methodes.buildInputDecoration(
                        "Enter New Password",
                        "8 symbol least",
                        Icon(Icons.lock, color: ColorManger.textcolor),
                        null),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (v)
                    {

                    },
                    obscureText: true,
                    decoration: Methodes.buildInputDecoration(
                        "Confirm New Password",
                        "8 symbol least",
                        Icon(
                          Icons.lock,
                          color: ColorManger.textcolor,
                        ),
                        null),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Methodes.elevetedButton(
                      context, "Confirm", LoginView(),globalKey)
                ],
              ),
            ),
          ),
        ));
  }
}
