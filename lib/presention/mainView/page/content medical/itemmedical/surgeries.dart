import 'package:flutter/material.dart';
class Surgeries extends StatefulWidget {
  const Surgeries({super.key});

  @override
  State<Surgeries> createState() => _SurgeriesState();
}

class _SurgeriesState extends State<Surgeries> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Surgeries"),),
    );
  }
}
