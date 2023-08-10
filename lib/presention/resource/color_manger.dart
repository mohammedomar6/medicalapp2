import 'package:flutter/material.dart';
class ColorManger {
  static Color background = const   Color.fromRGBO(187, 227, 227, 0.7333333333333333);
  static Color red = const Color(0xffe61f34);
  static Color textcolor =  const Color.fromRGBO(7, 51, 51, 0.7333333333333333);
  static Color white =  Colors.white;
  static Color cyen50 = Colors.cyan.shade50;

     static  var y =  const LinearGradient(
begin:Alignment.centerLeft ,
     end: Alignment.centerRight,
    colors: [

      Color.fromRGBO(64, 175, 179, 1 ),
        Color.fromRGBO(70, 111, 123, 1),

     //   Color.fromRGBO(49, 112, 121, 1),


        Color.fromRGBO(70, 111, 123, 1),
      Color.fromRGBO(4, 76, 100, 1),


    ]
      );   static  var x= const  LinearGradient(
begin:Alignment.centerLeft ,
     end: Alignment.centerRight,
    colors: [

      Color.fromRGBO(64, 184, 194, 1.0),

        Color.fromRGBO(70, 111, 123, 1),
      Color.fromRGBO(4, 76, 100, 1),


    ]
      );
}