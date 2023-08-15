import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalapp2/presention/newpassword/new_password.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/string_manger.dart';
import 'package:medicalapp2/presention/resource/values_manger.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import '../../methodes.dart';
import '../resource/routes_manger.dart';

class Verfiction extends StatefulWidget {
  Verfiction() {}

  @override
  State<Verfiction> createState() => _VerfictionState();
}

class _VerfictionState extends State<Verfiction> {
  var controller = TextEditingController(text: "");
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Varifcetion",
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
          height: AppSize.infinty,
          color: ColorManger.background,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p24),
                  child: SizedBox(
                    height: 200,
                    width: 400,
                    child: SvgPicture.asset(
                      ImageManger.check,
                    ),
                  ),
                ),
               const SizedBox(
                  height: 30,
                ),
              const   Text(
                  StringManger.VerfictionCode,
                  style: TextStyle(
                      fontSize: AppSize.s20, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p18, horizontal:40),
                  child:PinInputTextFormField(
                    validator: (val){

                      if(val!.isEmpty || val.length<=0 ){
                        return "ENter Verfiction Code";
                      }
                    },
                    controller: controller,
                    pinLength: 4,
                    decoration: CirclePinDecoration( bgColorBuilder:  PinListenColorBuilder(
                       ColorManger.background,  ColorManger.white),
                      strokeColorBuilder: PinListenColorBuilder(
                          ColorManger.textcolor, ColorManger.textcolor),
                    ),
                  ),
                ),
             const    SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManger.recivecode,
                      style: TextStyle(
                        color: ColorManger.textcolor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: Text(
                        StringManger.resend,
                        style: TextStyle(
                            color: ColorManger.textcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 2,
                  child: Methodes.elevetedButton(
                      context, StringManger.verify, NewPasswordView(),globalKey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
