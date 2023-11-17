import 'package:app_main/config/config.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/logic/logic.dart';
import 'package:flutter/material.dart';

import '../view.dart';

class ContactScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Key _name = const ValueKey('contact.name');
  final Key _email = const ValueKey('contact.email');
  final Key _message = const ValueKey('contact.message');
  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization();
    final ITheme theme = ThemeBloc.getCurrentTheme(context);
    final TextTheme textTheme = theme.getTheme().textTheme;
    final Size deviceSize = MediaQuery.of(context).size;
    return ScaffoldMyApp(
      appBarTitle: localization.titleContactUs,
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                IconTextFormField(
                  key: _name,
                  title: localization.titleName,
                ),
                IconTextFormField(
                  key: _email,
                  title: localization.titleName,
                ),
                IconTextFormField(
                  key: _message,
                  title: localization.titleName,
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(localization.titleSend),
          ),
        ],
      ),
    );
  }
}
