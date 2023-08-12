import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/presention/mainView/mainview.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';

import 'cubit/chat_cubit.dart';
import 'masseage.dart';

class NewChat extends StatefulWidget {
  const NewChat({Key? key}) : super(key: key);

  @override
  State<NewChat> createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final controller = TextEditingController();
  List<Massage> massage = [
    Massage(
        title: 'hello',
        time: DateTime.utc(2023, 3, 10, 5, 50),
        isSentbyme: false),
    Massage(
        title: 'll', time: DateTime.utc(2023, 3, 10, 1, 49), isSentbyme: true),
    Massage(
        title: 'chart mkdzmdkvkldjfdojfkfjkdmvlkd',
        time: DateTime.now(),
        isSentbyme: false),
    Massage(title: 'clvklcvklckvlv', time: DateTime.now(), isSentbyme: true),
  ];

  final ChatCubit cubit = ChatCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorManger.,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainView()));
              },
              icon: const Icon(Icons.arrow_back),
              color: ColorManger.textcolor),
          title: Text(
            " New Chat ",
            style: TextStyle(color: ColorManger.textcolor),
          ),
          centerTitle: true,
          backgroundColor: ColorManger.cyen50),
      body: BlocConsumer<ChatCubit, ChatState>(
        bloc: cubit,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            color: ColorManger.background,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: GroupedListView<Massage, DateTime>(
                      elements: massage,
                      groupBy: (massage) => DateTime(
                        massage.time.year,
                        massage.time.month,
                        massage.time.day,
                      ),
                      itemBuilder: (context, massage) => Align(
                        alignment: massage.isSentbyme
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          color: ColorManger.textcolor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              massage.title,
                              style: TextStyle(color: ColorManger.cyen50),
                            ),
                          ),
                        ),
                      ),
                      groupSeparatorBuilder: (massa) => const Text(""),
                      reverse: true,
                      order: GroupedListOrder.DESC,
                      useStickyGroupSeparators: true,
                      groupHeaderBuilder: (Massage massage) => SizedBox(
                        height: 40,
                        child: Container(
                          color: ColorManger.background,
                          alignment: Alignment.center,
                          child: Card(
                            color: ColorManger.textcolor,
                            child: Text(
                              DateFormat.yMMMd().format(massage.time),
                              style: TextStyle(color: ColorManger.cyen50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    //   expands: true,
                    //maxLength: 100,
                    minLines: 1,
                    maxLines: 4,

                    textInputAction: TextInputAction.newline,
                    controller: controller,
                    decoration: InputDecoration(
                        fillColor: ColorManger.textcolor,
                        focusColor: ColorManger.textcolor,
                        suffixIconColor: ColorManger.textcolor,
                        hoverColor: ColorManger.textcolor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManger.textcolor,
                            ),
                            borderRadius: BorderRadius.circular(28)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManger.textcolor)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManger.textcolor)),
                        hintText: " send your massage ",
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            final mass = Massage(
                                title: controller.text,
                                time: DateTime.now(),
                                isSentbyme: true);
                            cubit.sendTextToChatGpt(mass.title);
                            setState(() {
                              controller.text.isNotEmpty
                                  ? massage.add(mass)
                                  : null;

                              controller.clear();
                            });
                          },
                        )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
