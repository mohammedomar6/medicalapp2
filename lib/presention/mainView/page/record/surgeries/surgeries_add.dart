import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/page/record/surgeries/surgeries.dart';

import '../../../../../methodes.dart';
import '../../../../resource/color_manger.dart';
class surgeriesAdd extends StatefulWidget {
  const surgeriesAdd({super.key});

  @override
  State<surgeriesAdd> createState() => _surgeriesAddState();
}

class _surgeriesAddState extends State<surgeriesAdd> {
  var controllertitle =TextEditingController(text: "");
  var controllerplace =TextEditingController(text: "");
  var controllerdocotr =TextEditingController(text: "");
  var controllerdatepicker =TextEditingController(text: "");
  @override
  Widget build(BuildContext context){
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
          "Add Surgery",
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
                  "Have you had surgery before",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Enter the name of the surgery, the attending physician, and all information",
                  style: buildTextStyle(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllertitle,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "Surgeries name", "", null, null),
                  )),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllerdocotr,
                    decoration: Methodes.buildInputDecoration(
                        "Doctor Name", "", null, null),
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
                        "Surgeries date", "", null, null),
                  )),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllerplace,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "Place name", "", null, null),
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
