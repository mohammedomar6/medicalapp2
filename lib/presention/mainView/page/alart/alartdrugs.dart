import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'addAlart.dart';
import 'alart.dart';

class AlartDrugs extends StatefulWidget {

  @override
  State<AlartDrugs> createState() => _AlartDrugsState();
}

class _AlartDrugsState extends State<AlartDrugs> {
 List<ALart> list =[
   ALart(namedrug: "sytamol", time: DateTime.now(), stop: "For all year", count: 1.5, dateuse: "Dialy"),
   ALart(namedrug: "Proffen", time: DateTime.now(), stop: "For all year", count: 1.5, dateuse: "Dialy"),
   ALart(namedrug: "Naxprajol", time: DateTime.now(), stop: "For all year", count: 1.5, dateuse: "Dialy"),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),color: ColorManger.textcolor),
        backgroundColor: ColorManger.cyen50,
        centerTitle: true,
        title: Text(
          "Alart Drugs",
          style: TextStyle(color: ColorManger.textcolor),
        ),
      ),
      body:Container(
        color: ColorManger.background,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: list.length,itemBuilder: (context,index){
                return Container(
                  height:75,
                  child: Card(

  color: ColorManger.cyen50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(

backgroundColor: ColorManger.textcolor,
                            radius: 25,
                            child: Image.asset(ImageManger.drug,color: ColorManger.cyen50,width: 24,height: 24,),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name drug : ${list[index].namedrug}",style: TextStyle(color: ColorManger.textcolor,),),
                              Text("Time : ${DateFormat().add_Hm().format(list[index].time).toString()}",style: TextStyle(color: ColorManger.textcolor),)
                            ],
                          ),
                        ),
                        Text("Count: ${list[index].count}",style: TextStyle(color: ColorManger.textcolor),),
                        IconButton(onPressed: (){
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Are you sure ?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: ColorManger.textcolor),
                                    ),
                                    backgroundColor: ColorManger.background,
                                    surfaceTintColor: ColorManger.cyen50,
                                    actionsAlignment: MainAxisAlignment.spaceAround,
                                    contentPadding: EdgeInsets.all(20),
                                    alignment: Alignment.center,
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              list.removeAt(index);
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
                          });
                        }, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              flex: 0,
              child: Methodes.buildhomecard(
                  context, "Add an Alarm", "", ImageManger.add, AddAlart()),
            ),
          ],
        ),
      )

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
