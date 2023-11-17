import 'package:app_main/config/config.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/logic/logic.dart';
import 'package:flutter/material.dart';

import '../view.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization();
    final ITheme theme = ThemeBloc.getCurrentTheme(context);
    final TextTheme textTheme = theme.getTheme().textTheme;
    final Size deviceSize = MediaQuery.of(context).size;
    return const ScaffoldMyApp(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
          ],
        ),
      ),
      appBarTitle: 'Title',
    );
  }
}
