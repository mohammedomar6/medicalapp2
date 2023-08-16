import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/record/pharmaceutical/cubit/pharmaceutical_cubit.dart';
import 'package:medicalapp2/presention/mainView/page/record/pharmaceutical/pharmaceutical_item.dart';

import '../../../../../methodes.dart';
import '../../../../resource/color_manger.dart';
import 'pharmaceutical.dart';
class pharmaceuticalAdd extends StatefulWidget {
   pharmaceuticalAdd( this.pharmaCubit, {super.key});
  PharmaCubit pharmaCubit ;
  @override
  State<pharmaceuticalAdd> createState() => _pharmaceuticalAddState();
}

class _pharmaceuticalAddState extends State<pharmaceuticalAdd> {
  var controllermoreInfo =TextEditingController(text: "");
  var controllertitle =TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManger.textcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Pharmaceutical",
          style: buildTextStyle(),
        ),
        centerTitle: true,
        backgroundColor: ColorManger.cyen50,
      ),
      body: Container(
        height: double.infinity,
        color: ColorManger.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "What medications are you taking?",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Enter the name of the Drug and additional Information",
                  style: buildTextStyle(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllertitle,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        " Pharmaceutical name", "", null, null),
                  )),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllermoreInfo,
                    decoration: Methodes.buildInputDecoration(
                        "More info", "", null, null),
                    style: buildTextStyle(),
                  )),
              Container(
                  decoration: BoxDecoration(gradient: ColorManger.y),
                  child: TextButton(
                      onPressed: () {
                       widget.pharmaCubit.add(PharmaceuticalItem(nameDrug: controllertitle.text,moreinfo: controllermoreInfo.text));

                      },
                      child: Text(
                        " Save Information",
                        style: TextStyle(
                          color: ColorManger.cyen50,
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(color: ColorManger.textcolor);

}
