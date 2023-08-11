import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/page/record/surgeries/surgeries_add.dart';

import '../../../../resource/color_manger.dart';
import 'surgeries_item.dart';
class surgeries extends StatefulWidget {
  const surgeries({super.key});

  @override
  State<surgeries> createState() => _surgeriesState();
}

class _surgeriesState extends State<surgeries> {
  List <SurgeriesItem> list = [
    SurgeriesItem(title: "kaysarie", NameDoctor: "mohammed omar", dateTime: DateTime.now(), place: "Alashrafie"),
    SurgeriesItem(title: "kaysarie", NameDoctor: "yaser fawaz", dateTime: DateTime.now(), place: "Alashrafie"),
    SurgeriesItem(title: "kaysarie", NameDoctor: "ibrahim mawaldi", dateTime: DateTime.now(), place: "Alashrafie"),
    SurgeriesItem(title: "kaysarie", NameDoctor: "Ibrahim omar", dateTime: DateTime.now(), place: "Alashrafie"),
    SurgeriesItem(title: "kaysarie", NameDoctor: "mohammed omar", dateTime: DateTime.now(), place: "Alashrafie"),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        title: Text("Surgeries",
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
                        builder: (context) => surgeriesAdd()));
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
                        "name surgery : ${list[index].title}",
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
                    "Name doctor : ${list[index].NameDoctor}",
                    style: TextStyle(color: ColorManger.textcolor),
                  ),
                  Text(
                    "place : ${list[index].place}",
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
