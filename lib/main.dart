import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  OpenAI.apiKey = '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';
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
