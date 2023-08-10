import 'package:flutter/material.dart';
class Sensitivities extends StatefulWidget {
  const Sensitivities({super.key});

  @override
  State<Sensitivities> createState() => _SensitivitiesState();
}

class _SensitivitiesState extends State<Sensitivities> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Sensitivities"),),
    );
  }
}
