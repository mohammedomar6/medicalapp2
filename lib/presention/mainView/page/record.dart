import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Record",

          style: TextStyle(color: ColorManger.textcolor),
        ),
        backgroundColor: ColorManger.cyen50,
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
    );
  }
}
