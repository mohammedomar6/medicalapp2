import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/page/alart/alarm.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'alartdrugs.dart';

class AddAlart extends StatefulWidget {
  const AddAlart({super.key});

  @override
  State<AddAlart> createState() => _AddAlartState();
}

class _AddAlartState extends State<AddAlart> {
  double i = 0;
  String? dropdawnvalue = " medicine for life";

  List<String> list = ["Daily", "day after day", "Weekly", "Once a month"];
  String drop = "Daily";
  List<String> list1 = [" medicine for life", "until a certain date"];
  List<dynamic> x = [];
  List<ALarm> aLarm = [
    ALarm(
        value: 1.0,
        values: [1.0, 1.5, 1.75, 2.0, 3.0, 4.0, 0.5],
        list: ["one", "two", "three ", "Four"],
        controller: TextEditingController(text: ""),
        timeintial: TimeOfDay.now()),
  ];
  var controllerdatepicker = TextEditingController(text: "");
  var datepikcervalue = DateTime.now();
  var controllerNameMedical = TextEditingController(text: "");
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add Alart",
            style: TextStyle(color: ColorManger.textcolor),
          ),
          centerTitle: true,
          backgroundColor: ColorManger.cyen50),
      body: Form(
        key: globalKey,
        child: Container(
          padding: EdgeInsets.all(12),
          color: ColorManger.background,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                    "Add the medications you use to your medical alerts so that we can remind you of them at the right time"),
                TextFormField(
                  controller: controllerNameMedical,
                  validator: (value) {
                    if (value!.isEmpty && value.length == 0) {
                      return "enter Medicament Name";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: ColorManger.textcolor,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      prefixIcon: Image.asset(ImageManger.drugalart,
                          height: 10,
                          width: 10,
                          color: ColorManger.textcolor,
                          colorBlendMode: BlendMode.modulate),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: ColorManger.textcolor,
                      )),
                      enabled: true,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManger.textcolor)),
                      label: Text(
                        "Medicament Name",
                        style: TextStyle(color: ColorManger.textcolor),
                      ),
                      hintText: "Medicament Name"),
                ),
                DropdownButtonFormField(
                    dropdownColor: ColorManger.cyen50,
                    decoration: InputDecoration(
                        label: Text("The date of use of the Medicine"),
                        labelStyle: TextStyle(
                            color: ColorManger.textcolor, fontSize: 20)),
                    items: list
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String? val) {
                      setState(() {
                        drop = val!;
                      });
                    }),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 110 + i,
                    maxWidth: 400,
                  ),
                  child: ListView.builder(
                      itemCount: aLarm.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            aLarm[index].biuldAlarm(context),
                            IconButton(
                                onPressed: () {
                                  if (aLarm[index].controller.text.isEmpty &&
                                      aLarm[index].value.toString().isEmpty) {
                                    return;
                                  } else {
                                    if (index != 0)
                                      setState(() {
                                        i = i - 100;
                                        aLarm.removeAt(index);
                                      });
                                    else {
                                      setState(() {
                                        aLarm[index].controller.clear();
                                        aLarm[index].value = 1.0;
                                      });
                                    }
                                  }
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: ColorManger.textcolor,
                                )),
                          ],
                        );
                      }),
                ),
                Container(
                  decoration: BoxDecoration(gradient: ColorManger.y),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        i = i + 100;
                        print(aLarm.length);
                        aLarm.add(
                          ALarm(
                              value: 1.0,
                              values: [1.0, 1.5, 1.75, 2.0, 3.0, 4.0, 0.5],
                              list: ["one", "two", "three ", "Four"],
                              controller: TextEditingController(text: ""),
                              timeintial: TimeOfDay.now()),
                        );
                      });
                    },
                    enabled: true,
                    style: ListTileStyle.list,
                    title: Text(
                      "Add another dose",
                      style: TextStyle(color: ColorManger.cyen50),
                    ),
                    leading: Image.asset(
                      ImageManger.add,
                      color: ColorManger.cyen50,
                    ),
                  ),
                ),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        label: Text("When to stop the medication"),
                        labelStyle: TextStyle(color: ColorManger.textcolor)),
                    value: dropdawnvalue,
                    items: list1
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? v) {
                      setState(() {
                        dropdawnvalue = v!;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                if (dropdawnvalue == "until a certain date")
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty && val.length == 0) {
                        return "Enter Date ";
                      }
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        label: Text(
                          "Enter the Date",
                        ),
                        labelStyle: TextStyle(color: ColorManger.textcolor)),
                    controller: controllerdatepicker,
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
                                  onSurface:
                                      ColorManger.textcolor, // body text color
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
                          firstDate: DateTime.now(),
                          lastDate: DateTime.utc(
                            2026,
                            DateTime.monthsPerYear,
                          )).then((value) => {
                            controllerdatepicker.text =
                                DateFormat.yMMMd().format(value!).toString(),
                          });
                    },
                  ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(gradient: ColorManger.y),
                  child: TextButton(
                    onPressed: () {
                      if (!(globalKey.currentState!.validate())) {
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlartDrugs(

                                    alarm: aLarm,
                                    list: list,
                                    stop: list1,
                                    controller: controllerNameMedical,
                                  )));
                    },
                    child: Text(
                      "Add an alarm",
                      style: TextStyle(color: ColorManger.cyen50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
