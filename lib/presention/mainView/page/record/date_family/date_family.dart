import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resource/color_manger.dart';
import 'cubit/date_family_cubit.dart';
import 'date_family_add.dart';
import 'date_family_item.dart';
class DateFamily extends StatefulWidget {
  const DateFamily({super.key});

  @override
  State<DateFamily> createState() => _DateFamilyState();
}

class _DateFamilyState extends State<DateFamily> {

  DateFamilyCubit dateFamilyCubit = DateFamilyCubit();
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
        title: Text("Date Family",
            style: TextStyle(
              color: ColorManger.textcolor,
            )),
        actions: [
          IconButton(
              onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DateFamilyAdd(dateFamilyCubit)));
              },
              icon: Icon(
                Icons.add,
                color: ColorManger.textcolor,
                size: 30,
              ))
        ],
      ),
      body: BlocConsumer<DateFamilyCubit,DateFamilyState>(
        bloc: dateFamilyCubit,
        listener: (context,state){},
        builder:(context,state)=> Container(
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
                          "Name Sensitivities : ${state.list[index].title}",
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
                    Text("Degree Of Kinship ${state.list[index].kinship}", style: TextStyle(color: ColorManger.textcolor),),
                  ],
                ),
              );
            })),
      ),

    );
  }
}
