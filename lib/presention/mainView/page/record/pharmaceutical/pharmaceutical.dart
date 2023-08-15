import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/record/pharmaceutical/pharmaceutical_item.dart';

import '../../../../resource/color_manger.dart';
import 'pharmaceutical_add.dart';
class pharmaceutical extends StatefulWidget {
  const pharmaceutical({super.key});

  @override
  State<pharmaceutical> createState() => _pharmaceuticalState();
}

class _pharmaceuticalState extends State<pharmaceutical> {
  List <PharmaceuticalItem> list =[
    PharmaceuticalItem(moreinfo: "kcjkdfhkjf", nameDrug: "profeen"),
    PharmaceuticalItem(moreinfo: "kcjkdfhkjf", nameDrug: "sitamol"),
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
        title: Text("Pharmaceutical",
            style: TextStyle(
              color: ColorManger.textcolor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pharmaceuticalAdd()));
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
                        "Pharmaceutical name  : ${list[index].nameDrug}",
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
                  Text("More info ${list[index].moreinfo}", style: TextStyle(color: ColorManger.textcolor),),
                ],
              ),
            );
          })),

    );
  }
}
