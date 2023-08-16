import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp2/presention/mainView/page/alart/ServiceNotifaier.dart';

import 'app/app.dart';

void main()async {
  OpenAI.apiKey = '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';
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); //
  await NotificationService().requestIOSPermissions();
  runApp(MyApp());
}
