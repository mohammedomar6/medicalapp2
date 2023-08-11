import 'package:flutter/material.dart';
class pharmaceutical extends StatefulWidget {
  const pharmaceutical({super.key});

  @override
  State<pharmaceutical> createState() => _pharmaceuticalState();
}

class _pharmaceuticalState extends State<pharmaceutical> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Pharmaceutical")),
    );
  }
}
