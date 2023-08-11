import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalapp2/presention/mainView/page/content%20medical/itemmedical/surgeries.dart';
import 'package:medicalapp2/presention/mainView/page/record/MedicalExamintions/Medical_examinations.dart';
import 'package:medicalapp2/presention/mainView/page/record/chronic_diseases/chronic_diseases.dart';
import 'package:medicalapp2/presention/mainView/page/record/date%20family.dart';
import 'package:medicalapp2/presention/mainView/page/record/item.dart';
import 'package:medicalapp2/presention/mainView/page/record/my_personal_information.dart';
import 'package:medicalapp2/presention/mainView/page/record/pharmaceutical.dart';
import 'package:medicalapp2/presention/mainView/page/record/sensitivities.dart';
import 'package:medicalapp2/presention/mainView/page/record/surgeries/surgeries.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';


class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  List<ItemRecord> list = [
    ItemRecord(
        title: "My personal information",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon: ImageManger.My_personal_information,route: MyPersonalInformation()),
    ItemRecord(
        title: "Medical examinations",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon: ImageManger.date1,
    route: MedicalExaminations()),
    ItemRecord(

        title: "surgeries",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon:ImageManger.surgery,route: surgeries()),
    ItemRecord(
        title: "chronic diseases",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon: ImageManger.drug,route: ChronicDiseases()),
    ItemRecord(
        title: "pharmaceutical",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon: ImageManger.pharmaceutical,route: pharmaceutical()),
    ItemRecord(
        title: "sensitivities",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon: ImageManger.sensitiv,route: Sensitivities()),
    ItemRecord(
        title: "Family history of illness",
        prficon: Icons.arrow_forward_ios_rounded,
        suficon: ImageManger.date,route: DateFamily()),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.background,
      appBar: AppBar(
        title: Text(
          "Record Medical",
          style: TextStyle(color: ColorManger.textcolor),
        ),
        backgroundColor: ColorManger.cyen50,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(

          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>list[index].route));
              },
              child: Container(

               margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: ColorManger.y,
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 75,
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(

                        list[index].suficon,
width: 24,
                        height: 24,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text(
                        list[index].title,
                        style: TextStyle(
                            color: ColorManger.cyen50,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      flex: 5,
                    ),
                    Expanded(
                        child: Icon(
                          list[index].prficon,

                        ),
                        flex: 3),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
