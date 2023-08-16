import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/mainView/page/record/MedicalExamintions/cubit/medical_exam_cubit.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'AddMedicalExamintions.dart';
import 'ItemMedicalExam.dart';

class MedicalExaminations extends StatefulWidget {

   MedicalExaminations({super.key});

  @override
  State<MedicalExaminations> createState() => _MedicalExaminationsState();


}

class _MedicalExaminationsState extends State<MedicalExaminations> {


   MedicalExamCubit medicalExamCubit =MedicalExamCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManger.cyen50,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManger.textcolor,
            )),
        title: Text("Medical Examinations",
            style: TextStyle(
              color: ColorManger.textcolor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddMedicalExamintions(medicalExamCubit)));
              },
              icon: Icon(
                Icons.add,
                color: ColorManger.textcolor,
                size: 30,
              ))
        ],
      ),
      body: BlocConsumer<MedicalExamCubit,MedicalExamState>(
        bloc:medicalExamCubit ,
        listener: (context,state){},
        builder:(context,state) =>Container(
            color: ColorManger.background,
            child: ListView.builder(itemCount: state.list.length,itemBuilder: (context, index) {
              return Container(
                height: 125,
                decoration: BoxDecoration(
                  color: ColorManger.background,
                ),
                margin: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name Examination : ${state.list[index].title}",
                          style: TextStyle(color: ColorManger.textcolor),
                        ),
                        IconButton(onPressed: () {
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: ColorManger.cyen50,
                              actionsAlignment: MainAxisAlignment.center,
                              content: Text("Are sure of the deleting process"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        state.list.removeAt(index);
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
                        }, icon: Icon(Icons.delete)),
                      ],
                    ),
                    Text(
                      "Result : ${state.list[index].result}",
                      style: TextStyle(color: ColorManger.textcolor),
                    ),
                    Text(
                      "Date : ${state.list[index].dateTime}",
                      style: TextStyle(color: ColorManger.textcolor),
                    ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
