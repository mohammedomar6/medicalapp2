import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalapp2/methodes.dart';

import '../../../../resource/asset_manger.dart';
import '../../../../resource/color_manger.dart';
class Diseases extends StatefulWidget {
  const Diseases({super.key});

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  late var item = [];

  Future<void> readjson() async {
    final String response = await rootBundle.loadString("assets/symptoms.json");
    final dats = await json.decode(response);
    setState(() {
      item = dats["illnesses"];
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      readjson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar:Methodes.buildAppBararrow(context, "Diseases"),
      body:Container(
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
                  title: Text(item[index]['name'],
                      style: TextStyle(color: ColorManger.textcolor,fontWeight: FontWeight.bold
                      )),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              );
            }),
      ) ,

      );
  }
}
class Info extends StatelessWidget {
  var list ;
   Info({required this.list});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Methodes.buildAppBararrow(context, list['name']),
      body: Container(
        color: ColorManger.background,
        child: Column(
          children: [
            Image.asset(ImageManger.drugalart, height: 200,
              width: double.infinity,
              fit: BoxFit.none,
              color: ColorManger.textcolor,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Text("Symptoms:", style: TextStyle(
                  color: ColorManger.textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize
                      :20),),
                subtitle: Text(list['symptoms'],style: TextStyle(color: ColorManger.textcolor,fontSize: 16),),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Text("Treatment:", style: TextStyle(
                  color: ColorManger.textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize
                      :20),),
                subtitle: Text(list['treatment'],style: TextStyle(color: ColorManger.textcolor,fontSize: 16),),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Text("Protection:", style: TextStyle(
                  color: ColorManger.textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize
                      :20),),
                subtitle: Text(list['protection'],style: TextStyle(color: ColorManger.textcolor,fontSize: 16),),),
            ),
          ],
        ),
      ),
    );
  }
}
