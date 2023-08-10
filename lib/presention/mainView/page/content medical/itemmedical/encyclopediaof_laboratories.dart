import 'package:flutter/material.dart';
class EncyclopediaOflaboratories extends StatefulWidget {
  const EncyclopediaOflaboratories({super.key});

  @override
  State<EncyclopediaOflaboratories> createState() => _EncyclopediaOflaboratoriesState();
}

class _EncyclopediaOflaboratoriesState extends State<EncyclopediaOflaboratories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Encyclopedia Of laboratories"),),
    );
  }
}
