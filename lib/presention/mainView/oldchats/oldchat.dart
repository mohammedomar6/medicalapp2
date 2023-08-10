import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'chat.dart';

class OldChat extends StatefulWidget {
  const OldChat({Key? key}) : super(key: key);

  @override
  State<OldChat> createState() => _OldChatState();
}

class _OldChatState extends State<OldChat> {
  List <Chat> chat = [
    Chat(massage: [], id: 1),
    Chat(massage: [], id: 2),
    Chat(massage: [], id: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Previous consulting ",
          style: TextStyle(color: ColorManger.textcolor),

        ),
        backgroundColor: ColorManger.cyen50,
        centerTitle: true,
      ),
      body: Container(
        color: ColorManger.background,
        child: ListView.builder(itemBuilder: (context,index)=>Card(
          child: Text("${chat[index].id}"),
        ),itemCount: chat.length,),
      ),
    );
  }
}
