import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManger.background,
    appBar:  AppBar(    centerTitle: true,title: Text("setting",style: TextStyle(color: ColorManger.textcolor),),backgroundColor: ColorManger.cyen50),
    );
  }
}
