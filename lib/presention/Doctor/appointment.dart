import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/Doctor/patientsitem.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import '../AppointmentBooking/DoctorItem.dart';
import '../AppointmentBooking/appoitments_item.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

List<PatientsItem> list = [
  PatientsItem(
    name: "mohammed omar",
    appointmentDate: DateTime(2024, 3, 12,10,10),
    age: 10
  ),
  PatientsItem(
    name: "Ahmad omar",
    appointmentDate: DateTime(2024, 3, 12,12,10),
    age: 18,
  ),
];

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Appointment",
            style: TextStyle(color: ColorManger.textcolor),
          ),
          centerTitle: true,
          backgroundColor: ColorManger.cyen50),
      body: Container(
        color: ColorManger.background,
        child: ListView.builder(itemCount: list.length,itemBuilder: (context,index) => Container(

          child: Card(
            color: ColorManger.cyen50,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Patient Name : ${list[index].name}",style: TextStyle(color: ColorManger.textcolor,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Patient age : ${list[index].age}" ,style: TextStyle(color: ColorManger.textcolor,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Date Apointment: ${DateFormat().format(list[index].appointmentDate)}",style: TextStyle(color: ColorManger.textcolor,fontSize: 16),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(color:ColorManger.textcolor,child: TextButton(onPressed: (){}, child: Text("Accept",style: TextStyle(color: ColorManger.cyen50),),)),
                    Container(
                      color: ColorManger.background,
                      child: TextButton(onPressed: (){
                        setState(() {
                          list.removeAt(index);
                        });
                      }, child: Text("Delete",style: TextStyle(color: ColorManger.textcolor),)),
                    ),
                  ],
                )
              ],
            ) ,
          ),
        )),
      ),
    );
  }
}
