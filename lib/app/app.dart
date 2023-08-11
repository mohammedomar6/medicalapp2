import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import '../presention/resource/routes_manger.dart';
import '../presention/resource/thame_manger.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(
          color: ColorManger.textcolor,
        )))),
        timePickerTheme: TimePickerThemeData(
            dayPeriodBorderSide: BorderSide(color: ColorManger.textcolor),
            backgroundColor: ColorManger.cyen50,
            hourMinuteColor: ColorManger.cyen50,
            hourMinuteTextColor: ColorManger.textcolor,
            entryModeIconColor: ColorManger.textcolor,
            helpTextStyle: TextStyle(color: ColorManger.textcolor),
            dayPeriodTextStyle: TextStyle(
              color: ColorManger.textcolor,
            ),
            hourMinuteShape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            dialBackgroundColor: ColorManger.background,
            dialHandColor: ColorManger.textcolor,
            dialTextColor: ColorManger.textcolor,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            dayPeriodTextColor: ColorManger.white),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GeneretorRoutes.getRoutes,
      initialRoute: Routes.loginRoutes,
    );
  }
}
