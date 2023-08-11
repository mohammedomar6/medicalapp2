import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/record/chronic_diseases/chronic_diseases.dart';

import '../../../../../methodes.dart';
import '../../../../resource/color_manger.dart';
class ChronicAdd extends StatefulWidget {
  const ChronicAdd({super.key});

  @override
  State<ChronicAdd> createState() => _ChronicAddState();
}

class _ChronicAddState extends State<ChronicAdd> {
  var controllermoreInfo = TextEditingController(text: "");
  var controllertitle = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Add Chronic Diseases",
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
                  "Do you have chronic diseases?",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Enter the name of the disease and additional Information",
                  style: buildTextStyle(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllertitle,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "chronic diseases name", "", null, null),
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: ColorManger.y,
                      borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    child: Text("Save"),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ChronicDiseases()));
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(color: ColorManger.textcolor);

}
