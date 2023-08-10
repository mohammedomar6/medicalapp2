import 'package:flutter/material.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'addAlart.dart';

class AlartDrugs extends StatefulWidget {
   late   List? alarm ;
   late List? list;
   late List? stop ;
   late  TextEditingController? controller ;
  AlartDrugs({     this.alarm, this.list,  this.controller, this.stop});

  @override
  State<AlartDrugs> createState() => _AlartDrugsState();
}

class _AlartDrugsState extends State<AlartDrugs> {
  AlartDrugs x =  AlartDrugs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.cyen50,
        centerTitle: true,
        title: Text(
          "Alart Drugs",
          style: TextStyle(color: ColorManger.textcolor),
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Methodes.buildhomecard(
              context, "Add an Alarm", "", ImageManger.add, AddAlart()),

        ],
      ),
      /*Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorManger.background,
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                width: 250,
                height: 250,
                child: Image.asset(
                  color: ColorManger.textcolor,
                  ImageManger.drugalart,
                ),
              ),
              ListTile(
                title: SizedBox(
                    height: 80,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Add your medication and we will remind you",
                      style: TextStyle(
                          color: ColorManger.textcolor,
                          fontWeight: FontWeight.bold),
                    )),
                subtitle: Text(
                    "Add the medications you use to your medical alerts so that we can remind you of them at the right time"),
              ),
              SizedBox(
                height: 10,
              ),
              Methodes.buildhomecard(
                  context, "Add an Alarm", "", ImageManger.add, AddAlart()),
            ],
          ),
        ),
      ):*/
    );
  }
}
