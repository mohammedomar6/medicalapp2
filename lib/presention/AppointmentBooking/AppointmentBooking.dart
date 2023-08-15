import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import '../mainView/page/medical_visits/DoctorItem.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({super.key});

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  List<DoctorItem> list = [
    DoctorItem(
        name: "mohammeed",
        purview: "kalbie",
        Clinic_location: "Aleppo forkan dewar alsakhra ",
        money: 100,
        phoneNum: "0995925326",
        aboutDr:
            "Dr. Muhammad Omar is a urologist, a member of the Syrian Surgical Society and a member of the European Urological Association"),
    DoctorItem(
        name: "mohammeed",
        purview: "kalbie",
        Clinic_location: "Aleppo forkan dewar alsakhra ",
        money: 100,
        phoneNum: "0995925326",
        aboutDr:
            "Dr. Muhammad Omar is a urologist, a member of the Syrian Surgical Society and a member of the European Urological Association"),
    DoctorItem(
        name: "mohammeed",
        purview: "kalbie",
        Clinic_location: "Aleppo forkan dewar alsakhra ",
        money: 100,
        phoneNum: "0995925326",
        aboutDr:
            "Dr. Muhammad Omar is a urologist, a member of the Syrian Surgical Society and a member of the European Urological Association"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back,color: ColorManger.textcolor,)),
          title: Text(
            "Appointment Booking",
            style: TextStyle(color: ColorManger.textcolor),
          ),
          backgroundColor: ColorManger.cyen50,
        ),
        body: Container(
          color: ColorManger.background,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Card(
                    color: ColorManger.cyen50,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset(ImageManger.doctor,
                                  color: ColorManger.cyen50),
                              radius: 30,
                              backgroundColor: ColorManger.textcolor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dr ${list[index].name} "),
                                Text("purview:${list[index].purview}"),
                                Text("Location:${list[index].Clinic_location}"),
                                Text("Money:${list[index].money} \$"),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(gradient: ColorManger.y),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Appointment Booking",style: TextStyle(color: ColorManger.cyen50),)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
