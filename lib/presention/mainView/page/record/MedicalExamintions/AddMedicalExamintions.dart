import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/page/record/MedicalExamintions/Medical_examinations.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import '../../../../../methodes.dart';
import 'ItemMedicalExam.dart';

class AddMedicalExamintions extends StatefulWidget {
  const AddMedicalExamintions({super.key});

  @override
  State<AddMedicalExamintions> createState() => _AddMedicalExamintionsState();
}

class _AddMedicalExamintionsState extends State<AddMedicalExamintions> {
  var controllertitle = TextEditingController(text: "");
  var controllerresult = TextEditingController(text: "");
  var controllercenter = TextEditingController(text: "");
  var controllerdatepicker = TextEditingController();

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
          "Add Medical Examintions",
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
                  "Did you achieve a complete from complete ingredients?",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Enter the name of the test and the information that interests your doctor about it",
                  style: buildTextStyle(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllertitle,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "Examination name", "", null, null),
                  )),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllerresult,
                    decoration: Methodes.buildInputDecoration(
                        "The Test Result", "", null, null),
                    style: buildTextStyle(),
                  )),
              Container(

                  margin: EdgeInsets.all(12),
                  child: TextFormField(

                    controller: controllerdatepicker,
                    readOnly: true,
                    style: buildTextStyle(),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: ColorManger.background,
                                  // header background color
                                  onPrimary: ColorManger.textcolor,
                                  // header text color
                                  onSurface: ColorManger
                                      .textcolor, // body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: ColorManger
                                        .textcolor, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2010),
                          lastDate: DateTime.now())
                          .then((value) =>
                      {
                        controllerdatepicker.text = DateFormat.yMMMd()
                            .format(value!)
                            .toString(),
                      });
                    },
                    decoration: Methodes.buildInputDecoration(
                        "Examination date", "", null, null),
                  )),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllercenter,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "Center name", "", null, null),
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
                          builder: (context) => MedicalExaminations()));
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