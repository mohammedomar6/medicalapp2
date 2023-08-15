import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/medical_visits/appoitments.dart';
import 'package:medicalapp2/presention/mainView/page/medical_visits/visites.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import '../../../AppointmentBooking/AppointmentBooking.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        backgroundColor: ColorManger.background,
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              "Medical appointments and visits",
              style: TextStyle(color: ColorManger.textcolor),
            ),
            backgroundColor: ColorManger.cyen50),
        body: Column(children: [
        Container(
        decoration: BoxDecoration(gradient: ColorManger.y),
        child: TabBar(

          padding: EdgeInsets.all(4),
          dividerColor: ColorManger.cyen50,
          indicatorColor: ColorManger.cyen50,
          automaticIndicatorColorAdjustment: true,

          labelColor: ColorManger.cyen50,
          unselectedLabelColor: ColorManger.background,
          tabs: [
            Container(child: Tab(
                text: "visits", icon: Icon(Icons.video_camera_front_rounded))),
            Container(

              child: Tab(
                text: "appointments",
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          children: [
            Visits(),
            Appoitments(),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(gradient: ColorManger.y),
        child: TextButton(onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentBooking()));
        },
            child: Text("Appointment Booking",style: TextStyle(color: ColorManger.cyen50),),
          ),
      ),
          ]),
    ),);
  }
}
