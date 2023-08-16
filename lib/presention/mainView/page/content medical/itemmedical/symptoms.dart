import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalapp2/methodes.dart';

import '../../../../resource/color_manger.dart';
class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  late var item = [];

  Future<void> readjson() async {
    final String response = await rootBundle.loadString("assets/symptoms.json");
    final dats = await json.decode(response);
    setState(() {
      item = dats["symptoms"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      readjson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Methodes.buildAppBararrow(context, 'Symptoms'),
      body:Container(
        color: ColorManger.background,
        child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Container(
                height: 75,
                child: ListTile(
                  onTap: () {

                  },
                  title: Text("${item[index]}",
                      style: TextStyle(color: ColorManger.textcolor,fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              );
            }),
      ) ,
    );
  }
}
