import 'package:flutter/material.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/mainView/page/record/record.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

class MyPersonalInformation extends StatefulWidget {
  const MyPersonalInformation({super.key});

  @override
  State<MyPersonalInformation> createState() => _MyPersonalInformationState();
}

class _MyPersonalInformationState extends State<MyPersonalInformation> {
  String? value = "A+";
  var controllerSmoking = TextEditingController(text: "");
  var controllerCohol = TextEditingController(text: "");
  var controllerBlood = TextEditingController(text: "");

  List<String> list = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O-", "O+"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,

       leading: IconButton(onPressed: (){
         Navigator.pop(context);
       },icon: Icon(Icons.arrow_back,color: ColorManger.textcolor,),),
        title: Text(
          "My Personal Information",
          style: TextStyle(color: ColorManger.textcolor),
        ),
        backgroundColor: ColorManger.cyen50,
      ),
      body: Container(
        height: double.infinity,
        color: ColorManger.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                margin: EdgeInsets.all(18),
                child: TextFormField(
                  maxLength: 3,
                  keyboardType: TextInputType.phone,
                  onTap: null,
                  decoration: Methodes.buildInputDecoration(
                      "Hight", "Enter Hight cm ", null, null),
                ),
              ),
              Container(

                margin: EdgeInsets.all(18),
                child: TextFormField(
                  maxLength: 3,
                  keyboardType: TextInputType.phone,
                  decoration: Methodes.buildInputDecoration(
                      "Wight", "enter Wight kg", null, null),
                ),
              ),
              Container(
                margin: EdgeInsets.all(18),
                child: DropdownButtonFormField<String>(
                  dropdownColor: ColorManger.background,
                  value: list[0],
                  onChanged: (String? val) {
                    setState(() {
                      value = val.toString();
                    });
                  },
                  items: list
                      .map(
                        (e) => DropdownMenuItem(
                            value: e.toString(),
                            child: SingleChildScrollView(
                              child: Container(
                                height: 40,
                                alignment: Alignment.topCenter,
                                transformAlignment: Alignment.bottomCenter,
                                decoration:
                                    BoxDecoration(gradient: ColorManger.y),
                                child: Text(
                                  e.toString(),
                                  style: TextStyle(color: ColorManger.cyen50),
                                ),
                              ),
                            )),
                      )
                      .toList(),
                  onTap: () {},
                  decoration: Methodes.buildInputDecoration(
                      "Blood Type", "Enter Blood Type", null, null),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: TextFormField(
                  style: TextStyle(color: ColorManger.textcolor),
                  readOnly: true,
                  controller: controllerSmoking,
                  decoration:
                      Methodes.buildInputDecoration("Smoking", "", null, null),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Smoking",
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
                                      controllerSmoking.text = "Yes";
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
                                      controllerSmoking.text = "NO";
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
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: TextFormField(
                  style: TextStyle(color: ColorManger.textcolor),
                  readOnly: true,
                  controller: controllerCohol,
                  decoration: Methodes.buildInputDecoration(
                      "Drink Alcohol ", "", null, null),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Drink cohol",
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
                                      controllerCohol.text = "Yes";
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
                                      controllerCohol.text = "NO";
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
                  },
                ),
              ),
              Methodes.buildContainerTextButton(context),
            ],
          ),
        ),
      ),
    );
  }


}
