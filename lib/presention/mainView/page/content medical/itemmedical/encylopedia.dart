import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

class EncyclopediaOfMedicines extends StatefulWidget {
  const EncyclopediaOfMedicines({super.key});

  @override
  State<EncyclopediaOfMedicines> createState() =>
      _EncyclopediaOfMedicinesState();
}

class _EncyclopediaOfMedicinesState extends State<EncyclopediaOfMedicines> {
  late var item = [];

  Future<void> readjson() async {
    final String response = await rootBundle.loadString("assets/symptoms.json");
    final dats = await json.decode(response);
    setState(() {
      item = dats["drugs"];
    });
  }

  @override
  void initState() {
    super.initState();
    readjson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Methodes.buildAppBararrow(context, "Encyclopedia Of Medicines"),
        body: Container(
          color: ColorManger.background,
          child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 75,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Info(list: item[index])));
                    },
                    title: Text("${item[index]['name']}",
                        style: TextStyle(
                            color: ColorManger.textcolor,
                            fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                );
              }),
        ));
  }
}

class Info extends StatelessWidget {
  var list;

  Info({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methodes.buildAppBararrow(context,list['name']),
      body: Container(
        color: ColorManger.background,
        child: Column(
          children: [
            Image.asset(
              ImageManger.drugalart,
              height: 200,
              width: double.infinity,
              fit: BoxFit.none,
              color: ColorManger.textcolor,
            ),
            ListTile(
              title: Text(
                "Uses:",
                style: TextStyle(
                    color: ColorManger.textcolor, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                list['uses'],
                style: TextStyle(color: ColorManger.textcolor, fontSize: 16),
              ),
            ),
            ListTile(
              title: Text("Side Effects:",
                  style: TextStyle(
                      color: ColorManger.textcolor,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(list['side_effects'],style: TextStyle(color: ColorManger.textcolor,fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }


}
