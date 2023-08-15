import 'package:flutter/material.dart';

class ReatsApp extends StatefulWidget {
  const ReatsApp({super.key});

  @override
  State<ReatsApp> createState() => _ReatsAppState();
}

class _ReatsAppState extends State<ReatsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reats App"),
        centerTitle: true,
        leading: IconButton(onPressed: ()
        {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
