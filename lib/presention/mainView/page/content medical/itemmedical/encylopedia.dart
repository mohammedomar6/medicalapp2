import 'package:flutter/material.dart';
class EncyclopediaOfMedicines extends StatefulWidget {
  const EncyclopediaOfMedicines({super.key});

  @override
  State<EncyclopediaOfMedicines> createState() => _EncyclopediaOfMedicinesState();
}

class _EncyclopediaOfMedicinesState extends State<EncyclopediaOfMedicines> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("Encyclopedia Of Medicines"),),
    );
  }
}
