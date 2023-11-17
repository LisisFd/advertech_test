import 'package:app_main/config/config.dart';
import 'package:app_main/logic/bloc/bloc.dart';
import 'package:flutter/material.dart';

class IconTextFormField extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  const IconTextFormField({super.key, required this.title, this.validator});

  @override
  Widget build(BuildContext context) {
    final ITheme theme = ThemeBloc.getCurrentTheme(context);
    const double iconContainer = 50.0;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: theme.colorPallet.iconFormBackground,
          ),
          width: iconContainer,
          height: iconContainer,
          child: Icon(
            Icons.lock_open,
            color: theme.colorPallet.iconForm,
            size: iconContainer / 1.5,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: title),
          validator: validator,
        ),
      ],
    );
  }
}
