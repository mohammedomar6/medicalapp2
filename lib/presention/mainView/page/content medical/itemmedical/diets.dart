import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

class Diets extends StatefulWidget {
  const Diets({super.key});

  @override
  State<Diets> createState() => _DietsState();
}

class _DietsState extends State<Diets> {
  late var item= [


  ];

  Future<void> readjson() async {
    final String response = await rootBundle.loadString("assets/symptoms.json");
    final  dats = await json.decode(response);
    setState(() {
      item = dats["diets"];
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManger.cyen50,
        title: Text(
          "Diets",
          style: TextStyle(color: ColorManger.textcolor),

        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: ColorManger.textcolor,),),
      ),
      body: Container(
        color: ColorManger.background,
        child: ListView.builder(itemCount: item.length,itemBuilder: (context,index){

          return Container(
            height:75,
            child: ListTile(

              onTap: (){

              },
              title: Text("${item[index]['name']}",style: TextStyle(color: ColorManger.textcolor)),
              trailing: Icon(Icons.arrow_forward_ios_rounded),

            ),
          );
        }),
      )
    );
  }
}
