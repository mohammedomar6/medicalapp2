import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalapp2/presention/AppointmentBooking/Cubit/Appointment_cubit.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'DoctorItem.dart';
import 'ReservationConfirmation.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({super.key});

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {

AppoitmentCubit appoitmentCubit =AppoitmentCubit();
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
        body: BlocConsumer<AppoitmentCubit,AppoimtmentState>(
          bloc: appoitmentCubit,
         listener: (context,state){},
          builder: (context,state)=>Container(
            color: ColorManger.background,
            child: ListView.builder(
                itemCount: state.list.length,
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text("Dr ${state.list[index].Doctor.name} ",style: TextStyle(color: ColorManger.textcolor),),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("purview:${state.list[index].Doctor.purview}",style: TextStyle(color: ColorManger.textcolor)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0),
                                    child: Text("Location:${state.list[index].Doctor.Clinic_location}",style: TextStyle(color: ColorManger.textcolor)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left :8.0),
                                    child: Text("Money:${state.list[index].Doctor.money} \$",style: TextStyle(color: ColorManger.textcolor)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(gradient: ColorManger.y),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReservationConfirmation(appoitmentCubit)));
                                },
                                child: Text("Appointment Booking",style: TextStyle(color: ColorManger.cyen50),)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
