import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/record/sensitivities/sensitivities.dart';

import '../../../../../methodes.dart';
import '../../../../resource/color_manger.dart';
class SensitivitiesAdd extends StatefulWidget {
  const SensitivitiesAdd({super.key});

  @override
  State<SensitivitiesAdd> createState() => _SensitivitiesAddState();
}

class _SensitivitiesAddState extends State<SensitivitiesAdd> {
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
          "Add Sensitivities",
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
                  "Do you have Sensitivities?",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold,

                      fontSize: 20),
                ),
                subtitle: Text(
                  "Enter the name of the Sensitivities and additional Information",
                  style: buildTextStyle(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllertitle,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "name senstivities", "", null, null),
                  )),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllermoreInfo,
                    decoration: Methodes.buildInputDecoration(
                        "More info", "", null, null),
                    style: buildTextStyle(),
                  )),
              Methodes.buildContainerTextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(color: ColorManger.textcolor);

}
