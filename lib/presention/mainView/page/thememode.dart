import 'package:flutter/material.dart';
class ThemeModee extends StatefulWidget {
  const ThemeModee({super.key});

  @override
  State<ThemeModee> createState() => _ThemeModeeState();
}

class _ThemeModeeState extends State<ThemeModee> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
