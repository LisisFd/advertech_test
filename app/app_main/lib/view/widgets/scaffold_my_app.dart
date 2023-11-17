import 'package:app_main/config/theme/i_theme.dart';
import 'package:flutter/material.dart';

import '../../logic/logic.dart';

class ScaffoldMyApp extends StatelessWidget {
  final String appBarTitle;
  final Widget body;

  const ScaffoldMyApp(
      {super.key, required this.body, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final ITheme theme = ThemeBloc.getCurrentTheme(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: theme.getTheme().textTheme.titleMedium,
        ),
      ),
      body: Stack(
        children: [
          body,
        ],
      ),
      backgroundColor: theme.getTheme().colorScheme.background,
    );
  }
}
