import 'package:flutter/material.dart';

import '../../../resource/color_manger.dart';



class ALarm {
  double value;
  List<double> values;
  List<String> list;
  var timeintial;
  var controller;
  ALarm(
      {required this.value,
      required this.values,
      required this.list,
      required this.controller,
      required this.timeintial});

  Row biuldAlarm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
          width: 100,
          padding: EdgeInsets.all(8),
          child: TextFormField(
           validator: (valu){
             if(valu!.isEmpty && valu.length==0){
               return "Enter Time";
             }
             return null ;

           },
            enabled: true,
            expands: false,
            style: TextStyle(
              color: ColorManger.textcolor,
              fontSize: 20,
            ),
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManger.textcolor)),
              label: Text(
                "Time",
                style: TextStyle(color: ColorManger.textcolor),
              ),
            ),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: timeintial,
              ).then((value) {
                {
                  controller.text = value!.format(context).toString();
                }
              });
            },
          ),
        ),
        Container(
          height: 65,
          width: 100,
          child: DropdownButtonFormField<double>(
            validator: (val){
              if(val!.isNaN && val==0 ){
                return "Enter  Count";
              }
              return null ;
            },
              decoration: InputDecoration(

                  label: Text("Count",style: TextStyle(color: ColorManger.textcolor,fontSize: 20),),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(

                    color: ColorManger.textcolor,
                  ),),),
              style: TextStyle(
                color: ColorManger.textcolor,
                fontSize: 20,
              ),
              dropdownColor: ColorManger.cyen50,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(15),
              value: value,
              items: values
                  .map((e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        child: Text(
                          e.toString(),
                        ),
                        value: e,
                      ))
                  .toList(),
              onChanged: (double? v) {
                value = v!;
              }),
        ),

      ],
    );
  }
}
