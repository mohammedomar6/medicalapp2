import 'package:flutter/material.dart';
class MyPatients extends StatefulWidget {
  const MyPatients({super.key});

  @override
  State<MyPatients> createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('My Patients'),),
    );
  }
}
