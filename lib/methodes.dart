import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';
import 'package:medicalapp2/presention/resource/values_manger.dart';

class Methodes {
  static InputDecoration buildInputDecoration(
      lebel, hintlebel, iconpref, suffixicon) {
    return InputDecoration(
      prefixIconColor: ColorManger.textcolor,
      border: UnderlineInputBorder(borderRadius: BorderRadius.circular(25)),
      label: Text(
        "$lebel",
        style: TextStyle(
            color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
            fontSize: AppSize.s22,),
      ),
      hintText: "$hintlebel",
      hintStyle: TextStyle(fontSize: AppSize.s14, color: Colors.grey.shade500),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade600),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.blueGrey.shade600,
          ),
          borderRadius: BorderRadius.circular(25)),
      contentPadding: EdgeInsets.all(AppPadding.p12),
      prefixIcon: iconpref,
      suffixIcon: suffixicon,
    );
  }

  static AppBar buildAppBar({context, title, routeleading}) {
    return AppBar(
      elevation: 0,
      title: Text(
        "$title",
        style: TextStyle(
          color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(187, 227, 227, 0.7333333333333333),
      leading: buildIconButton(
          context: context, icon: Icons.arrow_back, route: routeleading),
    );
  }

  static IconButton buildIconButton({context, route, icon}) {
    return IconButton(
      color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
      iconSize: 27,
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
      },
      icon: Icon(icon),
    );
  }

  static Container buildVerfictionCode() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(30)),
      width: 60,
      height: 45,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 0.8,
          fontSize: 25,
          color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
        ),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
                    width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: Color.fromRGBO(7, 51, 51, 0.7333333333333333),
                    width: 5))),
      ),
    );
  }

  static Container buildElevetedTextButton(context, text, navigator) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(gradient: ColorManger.y),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, navigator);
        },
        child: Text(
          "$text",
          style: TextStyle(color: ColorManger.white),
        ),
      ),
    );
  }

  static TextStyle buildTextStyle({fontwight}) => TextStyle(
        color: ColorManger.textcolor,
        fontWeight: fontwight,
      );

  static TextButton buildTextButton(BuildContext context, text, navigator) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>navigator));
      },
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorManger.textcolor,
        ),
      ),
    );
  }

  static Widget elevetedButton(
      context, text,  navigator, GlobalKey<FormState> globalKey) {
    return Container(
      width: 100,
      decoration: BoxDecoration(gradient: ColorManger.y),
      child: TextButton(

        child: Text(text,style: TextStyle(color: ColorManger.cyen50,fontSize: 20),),
        onPressed: () {
          if (!(globalKey.currentState!.validate())) {
            return;
          }
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigator),
          );
        },
      ),
    );
  }
static  Padding buildhomecard(BuildContext context, String text, String subtitle,
      String imagepath, routepath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: ColorManger.y, borderRadius: BorderRadius.circular(40)),
        width: 350,
        height: 90,
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          textColor: ColorManger.white,
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade200),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => routepath),
            );
          },
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              ImageManger.right_arrow,
              height: 25,
              width: 25,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold,color: ColorManger.cyen50),
          ),
          leading: Image.asset(
            imagepath,
            height: 36,
            width: 36,
          ),
        ),
      ),
    );
  }
 static Container buildContainerTextButton(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: ColorManger.y),
        child: TextButton(

            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> MainView()));
            },
            child: Text(

              " Save Information",
              style: TextStyle(color: ColorManger.cyen50,),

            )));
  }
}
