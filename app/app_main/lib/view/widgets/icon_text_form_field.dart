import 'package:app_main/config/config.dart';
import 'package:app_main/logic/bloc/bloc.dart';
import 'package:flutter/material.dart';

class IconTextFormField extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final void Function(Key, String)? onSaved;
  const IconTextFormField(
      {super.key, required this.title, this.validator, this.onSaved});

  String? _onSaved(String? value) {
    Key? widgetKey = key;
    if (value != null && widgetKey != null) {
      onSaved?.call(widgetKey, value);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ITheme theme = ThemeBloc.getCurrentTheme(context);
    const double iconContainer = 40.0;
    const padding = SizedBox(
      width: 30,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
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
            size: iconContainer / 2.2,
          ),
        ),
        padding,
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(labelText: title),
            validator: validator,
            onSaved: _onSaved,
          ),
        ),
      ],
    );
  }
}
