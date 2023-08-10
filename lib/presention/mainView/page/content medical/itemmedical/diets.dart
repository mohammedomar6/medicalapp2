import 'package:flutter/material.dart';
class Diets extends StatefulWidget {
  const Diets({super.key});

  @override
  State<Diets> createState() => _DietsState();
}

class _DietsState extends State<Diets> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(  appBar: AppBar(title: Text("Diets"),),);
  }
}
