import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  OpenAI.apiKey = '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';
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
