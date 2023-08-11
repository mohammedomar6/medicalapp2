import 'package:flutter/material.dart';

import '../../../../resource/color_manger.dart';
import 'chronic_add.dart';
import 'chronicitem.dart';

class ChronicDiseases extends StatefulWidget {
  const ChronicDiseases({super.key});

  @override
  State<ChronicDiseases> createState() => _ChronicDiseasesState();
}

class _ChronicDiseasesState extends State<ChronicDiseases> {
  List<ChronicItem> list = [
    ChronicItem(moreinfo: "skhskdfghskdfhgdskjg", nameDiseas: "naour"),
    ChronicItem(moreinfo: "skhskdfghskdfhgdskjg", nameDiseas: "malad"),
    ChronicItem(moreinfo: "skhskdfghskdfhgdskjg", nameDiseas: "malad"),
    ChronicItem(moreinfo: "skhskdfghskdfhgdskjg", nameDiseas: "sugry"),
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
        title: Text("Chronic Diseases",
            style: TextStyle(
              color: ColorManger.textcolor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChronicAdd()));
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
                      "name chronic diseases : ${list[index].nameDiseas}",
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
/*
 ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
            return Container(
              height: 125,

              decoration: BoxDecoration(
                color: ColorManger.background,
              ),
              margin: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    title: Text(
                      "name surgery : ${list[index].nameDiseas}",
                      style: TextStyle(color: ColorManger.textcolor),
                    ),
                    subtitle: Text("more info ${list[index].moreinfo}", style: TextStyle(color: ColorManger.textcolor),),
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
            );
          })),  */
