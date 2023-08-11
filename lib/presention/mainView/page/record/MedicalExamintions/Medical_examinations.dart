import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'AddMedicalExamintions.dart';
import 'ItemMedicalExam.dart';

class MedicalExaminations extends StatefulWidget {

   MedicalExaminations({super.key});

  @override
  State<MedicalExaminations> createState() => _MedicalExaminationsState();


}

class _MedicalExaminationsState extends State<MedicalExaminations> {
   static List<ItemExam> list = [
    ItemExam(
        title: "globin",
        result: "12",
        dateTime: DateTime.now(),
        Center: "afandi"),
    ItemExam(
        title: "globin",
        result: "14",
        dateTime: DateTime.now(),
        Center: "afandi"),
    ItemExam(
        title: "globin",
        result: "15",
        dateTime: DateTime.now(),
        Center: "afandi"),
    ItemExam(
        title: "globin",
        result: "16",
        dateTime: DateTime.now(),
        Center: "afandi"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManger.cyen50,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManger.textcolor,
            )),
        title: Text("Medical Examinations",
            style: TextStyle(
              color: ColorManger.textcolor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddMedicalExamintions()));
              },
              icon: Icon(
                Icons.add,
                color: ColorManger.textcolor,
                size: 30,
              ))
        ],
      ),
      body: Container(
          color: ColorManger.background,
          child: ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
            return Container(
              height: 125,
              decoration: BoxDecoration(
                color: ColorManger.background,
              ),
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name Examination : ${list[index].title}",
                        style: TextStyle(color: ColorManger.textcolor),
                      ),
                      IconButton(onPressed: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            backgroundColor: ColorManger.cyen50,
                            actionsAlignment: MainAxisAlignment.center,
                            content: Text("Are sure of the deleting process"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      list.removeAt(index);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: ColorManger.cyen50),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorManger.textcolor))),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorManger.cyen50)),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "No",
                                    style:
                                    TextStyle(color: ColorManger.textcolor),
                                  )),

                            ],
                          );
                        });
                      }, icon: Icon(Icons.delete)),
                    ],
                  ),
                  Text(
                    "Result : ${list[index].result}",
                    style: TextStyle(color: ColorManger.textcolor),
                  ),
                  Text(
                    "Date : ${DateFormat().add_yMEd().format(list[index].dateTime).toString()}",
                    style: TextStyle(color: ColorManger.textcolor),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
