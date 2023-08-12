import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/login/login_view.dart';
import 'package:medicalapp2/presention/mainView/new%20chat/newchat.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import '../oldchats/oldchat.dart';
import 'alart/alartdrugs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List images = [
    ImageManger.home1,
    ImageManger.home2,
    ImageManger.home3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: TextButton(
        child: const Text("log out"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
        },
      )),
      backgroundColor: ColorManger.background,
      appBar: AppBar(
        elevation: 0.2,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "MediPal",
          style: TextStyle(color: ColorManger.textcolor),
        ),
        backgroundColor: ColorManger.cyen50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
                carouselController: CarouselController(),
                itemCount: 3,
                itemBuilder: (context, index, realindex) => Column(
                      children: [
                        Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: 290,
                          height: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(gradient: ColorManger.y),
                          width: 290,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NewChat()),
                              );
                            },
                            child: Text(
                              " New medical advice ",
                              style: TextStyle(color: ColorManger.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                options: CarouselOptions(
                    height: 270,
                    animateToClosest: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.linear)),
            buildhomecard(
                context,
                "My previous medical consultations ",
                "View doctors' recommendations for your previous consultations",
                ImageManger.health,
                const OldChat()),
            buildhomecard(
              context,
              "New medical advice ",
              "Get a reliable medical reference within one minute",
              ImageManger.healthcare,
              const NewChat(),
            ),
            buildhomecard(
                context,
                "Medication stimulant",
                "Add your medication and we'll remind you when it's due",
                ImageManger.alart,
                AlartDrugs()),
          ],
        ),
      ),
    );
  }

  Padding buildhomecard(BuildContext context, String text, String subtitle,
      String imagepath, routepath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: ColorManger.y, borderRadius: BorderRadius.circular(40)),
        width: 400,
        height: 100,
        child: ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          textColor: ColorManger.white,
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade200),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => routepath),
            );
          },
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              ImageManger.right_arrow,
              height: 25,
              width: 25,
            ),
          ),
          title: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(
            imagepath,
            height: 36,
            width: 36,
          ),
        ),
      ),
    );
  }
}
