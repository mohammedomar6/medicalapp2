import 'package:flutter/material.dart';
class Diseases extends StatefulWidget {
  const Diseases({super.key});

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(title: Text("Diseases"),),);
  }
}
