import 'package:flutter/material.dart';
class DateFamily extends StatefulWidget {
  const DateFamily({super.key});

  @override
  State<DateFamily> createState() => _DateFamilyState();
}

class _DateFamilyState extends State<DateFamily> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Date Family")),
    );
  }
}
