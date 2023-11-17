///TODO: add localization
// import 'package:app_main/localizations/generated/app_localizations.dart';
import 'package:flutter/material.dart';

void runFullApp() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget materialApp = const MaterialApp(
      supportedLocales: [
        Locale('en'),
      ],
      home: SizedBox(),
    );

    return materialApp;
  }
}
