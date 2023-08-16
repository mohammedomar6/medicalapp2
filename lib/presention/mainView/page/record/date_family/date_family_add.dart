import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/record/date_family/date_family_item.dart';

import '../../../../../methodes.dart';
import '../../../../resource/color_manger.dart';
import 'cubit/date_family_cubit.dart';
import 'date_family.dart';

class DateFamilyAdd extends StatefulWidget {

  DateFamilyAdd(this.dateFamilyCubit, {super.key});
  DateFamilyCubit dateFamilyCubit;
  @override
  State<DateFamilyAdd> createState() => _DateFamilyAddState();
}

class _DateFamilyAddState extends State<DateFamilyAdd> {
  var controllertitle = TextEditingController(text: "");
  var controllerDropDawn = TextEditingController(text: "");
  String value = "Dad";
  List<String> list = [
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Son/Daughter",
    "Husband",
    "wife",
  ];

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
                  "Does anyone in your family suffer from chronic diseases?",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Enter the diseases he suffers from and the information that may interest the doctor about it",
                  style: buildTextStyle(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: controllertitle,
                    style: buildTextStyle(),
                    decoration: Methodes.buildInputDecoration(
                        "Name  disease", "", null, null),
                  )),
              Container(
                margin: EdgeInsets.all(12),
                child: DropdownButtonFormField(
                  dropdownColor: ColorManger.cyen50,
                    decoration: Methodes.buildInputDecoration(
                        "degree of kinship", "", null, null),
                    items: list
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        value = val!;
                      });
                    }),
              ),
        Container(
            decoration: BoxDecoration(gradient: ColorManger.y),
            child: TextButton(
                onPressed: () {
                   widget.dateFamilyCubit.addDateFamily(DateFamilyItem(title: controllertitle.text, kinship: controllerDropDawn.text));
                   Navigator.pop(context);
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
