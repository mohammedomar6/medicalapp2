import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medicalapp2/presention/mainView/page/content%20medical/itemmedical.dart';

import '../../../resource/asset_manger.dart';
import '../../../resource/color_manger.dart';
import 'itemmedical/Diseases.dart';
import 'itemmedical/diets.dart';
import 'itemmedical/encyclopediaof_laboratories.dart';
import 'itemmedical/encylopedia.dart';
import 'itemmedical/news.dart';
import 'itemmedical/sensitivities.dart';
import 'itemmedical/surgeries.dart';
import 'itemmedical/symptoms.dart';

class MedicalContent extends StatefulWidget {
  const MedicalContent({Key? key}) : super(key: key);

  @override
  State<MedicalContent> createState() => _MedicalContentState();
}

class _MedicalContentState extends State<MedicalContent> {
  List<dynamic> card = [
    MedicalItem(
        route: Diets(),
        title: "Diets",
        imageroute: ImageManger.diet,
        subtitle: "All diets and the best recipes"),
    MedicalItem(
        route: NewsAndArticle(),
        title: "News and articles",
        imageroute: ImageManger.news,
        subtitle: "The most important health articles and the latest news"),
    MedicalItem(
        route: EncyclopediaOfMedicines(),
        title: "Encyclopedia of Medicines",
        imageroute: ImageManger.drug,
        subtitle: "More than 15,000 medicines"),
    MedicalItem(
        route: EncyclopediaOflaboratories(),
        title: "Encyclopedia of laboratories",
        imageroute: ImageManger.laboratory,
        subtitle: "More than 2000 laboratory tests"),
    MedicalItem(
        route: Diseases(),
        title: "Diseases",
        imageroute: ImageManger.heart,
        subtitle: "More than 100,000 diseases"),
    MedicalItem(
        title: "Sensitivities",
        route: Sensitivities(),
        imageroute: ImageManger.sensitivity,
        subtitle: "More than 1000 types of allergies"),
    MedicalItem(
        route: Symptoms(),
        title: "Symptoms",
        imageroute: ImageManger.chill,
        subtitle: "More than 20,000 thousand types of symptoms"),
    MedicalItem(
        route: Surgeries(),
        title: "surgeries",
        imageroute: ImageManger.hospital,
        subtitle: "More than 2000 types of surgeries"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManger.background,
        appBar: AppBar(
          elevation:0.15,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              "Medical content",
              style: TextStyle(color: ColorManger.textcolor),
            ),
           backgroundColor: ColorManger.cyen50
    ),
        body: GridView.builder(
            padding: EdgeInsets.only(top: 15),
            itemCount: card.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              childAspectRatio: 1,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => card[index].route));
                  },
                  child: Card(
                    color: ColorManger.background,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: ColorManger.x,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            card[index].imageroute,

                          ),
                          Text("${card[index].title}",
                              style: TextStyle(
                                  color: ColorManger.cyen50,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${card[index].subtitle}",
                              style: TextStyle(
                                  color: ColorManger.cyen50, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
