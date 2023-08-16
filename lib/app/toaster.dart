import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Toaster {
  Toaster._();

  static void showToast(String text) {
    BotToast.showText(text: text);
  }

  static void showLoading() {
    BotToast.showLoading();
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showNotification({
    Widget Function(void Function())? leading,
    Widget Function(void Function())? title,
    Widget Function(void Function())? subtitle,
    Color? backgroundColor,
  }) {
    BotToast.showNotification(
      title: title,
      subtitle: subtitle,
      leading: leading,
      backgroundColor: backgroundColor,
    );
  }
  // static Future<bool> showPopDialog(BuildContext context) async {
  //   return await showDialog(
  //         context: context,
  //         builder: (_) {
  //           final Size size = MediaQuery.of(context).size;
  //           return Dialog(
  //             backgroundColor: Colors.transparent,
  //             elevation: 5,
  //             child: Container(
  //               padding: EdgeInsets.all(size.width * .05),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   const Text('warning'),
  //                   const Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(height: 15),
  //                       Text('ignore Changes'),
  //                       SizedBox(height: 15),
  //                     ],
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       MainButton(
  //                         text: 'cancel',
  //                         color: AppColors.grey,
  //                         textColor: Colors.grey.shade700,
  //                         onPressed: () => Navigator.of(_).pop(false),
  //                       ),
  //                       MainButton(
  //                         text: 'agree',
  //                         color: AppColors.orange,
  //                         textColor: Colors.white,
  //                         onPressed: () => Navigator.of(_).pop(true),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       ) ??
  //       false;
  // }
}
