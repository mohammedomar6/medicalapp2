import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/AppointmentBooking/DoctorItem.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import '../../../AppointmentBooking/appoitments_item.dart';

class Appoitments extends StatefulWidget {
  const Appoitments({super.key});

  @override
  State<Appoitments> createState() => _AppoitmentsState();
}

class _AppoitmentsState extends State<Appoitments> {
  List<AppoitmentsItem> list = [
    AppoitmentsItem(
      Doctor:  DoctorItem(
          name: "mohammeed",
          purview: "kalbie",
          Clinic_location: "Aleppo forkan dewar alsakhra ",
          money: 100,
          phoneNum: "0995925326",
          aboutDr:
          "Dr. Muhammad Omar is a urologist, a member of the Syrian Surgical Society and a member of the European Urological Association"),
      dateTime: DateTime(2024, 3, 12),
    ),
    AppoitmentsItem(
      Doctor:  DoctorItem(
          name: "mohammeed",
          purview: "kalbie",
          Clinic_location: "Aleppo forkan dewar alsakhra ",
          money: 100,
          phoneNum: "0995925326",
          aboutDr:
          "Dr. Muhammad Omar is a urologist, a member of the Syrian Surgical Society and a member of the European Urological Association"),
      dateTime: DateTime(2024, 3, 15),
    ),
    AppoitmentsItem(
      Doctor: DoctorItem(
          name: "mohammeed",
          purview: "kalbie",
          Clinic_location: "Aleppo forkan dewar alsakhra ",
          money: 100,
          phoneNum: "0995925326",
          aboutDr:
          "Dr. Muhammad Omar is a urologist, a member of the Syrian Surgical Society and a member of the European Urological Association"),
      dateTime: DateTime(2024, 3, 16),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            color: ColorManger.cyen50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 4),
                      child: CircleAvatar(
                        radius: 30,
                          backgroundColor: ColorManger.textcolor,

                          child: Image.asset(ImageManger.doctor,color: ColorManger.cyen50,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dr ${list[index].Doctor.name}",
                            style: TextStyle(
                                color: ColorManger.textcolor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Purview: ${list[index].Doctor.purview}",
                            style: TextStyle(color: ColorManger.textcolor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Address: ${list[index].Doctor.Clinic_location}",
                    style: TextStyle(color: ColorManger.textcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    " Date:${DateFormat.yMMMMEEEEd().format(list[index].dateTime).toString()}",
                    style: TextStyle(color: ColorManger.textcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: ColorManger.textcolor,
                      ),
                      Text(
                        "${list[index].Doctor.Clinic_location}",
                        style: TextStyle(color: ColorManger.textcolor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.monetization_on_outlined,
                        color: ColorManger.textcolor,
                      ),
                      Text(
                        "Scout fee at the clinic ${list[index].Doctor.money} \$ ",
                        style: TextStyle(color: ColorManger.textcolor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
