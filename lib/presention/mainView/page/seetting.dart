import 'package:flutter/material.dart';
class Seetting extends StatefulWidget {
  const Seetting({super.key});

  @override
  State<Seetting> createState() => _SeettingState();
}

class _SeettingState extends State<Seetting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Setting"),leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))),
    );
  }
}
