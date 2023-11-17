import 'package:app_main/config/config.dart';
import 'package:app_main/localization.dart';
import 'package:app_main/logic/logic.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  final Key _name = const ValueKey('contact.name');
  final Key _email = const ValueKey('contact.email');
  final Key _message = const ValueKey('contact.message');
  final Map<Key, String> _formResult = {};

  String? _nullOrEmptyValidate(BuildContext context, String? value) {
    final localization = context.localization();
    String? result;
    if (value == null || value.isEmpty) {
      result = localization.errorRequiredField;
    }
    return result;
  }

  String? _mailValidate(BuildContext context, String? value) {
    final localization = context.localization();
    String? result;
    result = _nullOrEmptyValidate(context, value);

    if (result == null) {
      bool emailValidate = EmailValidator.validate(value ?? "");
      if (!emailValidate) {
        result = localization.errorIncorrectEmail;
      }
    }
    return result;
  }

  void _sendPress(BuildContext context) {
    ContactScreenBloc bloc = BlocProvider.of<ContactScreenBloc>(context);
    FormState? formState = _formKey.currentState;
    if (formState == null) return;
    if (formState.validate()) {
      formState.save();
      FormContactInformation information = FormContactInformation(
        name: _formResult.getNotNullString(_name),
        email: _formResult.getNotNullString(_email),
        message: _formResult.getNotNullString(_message),
      );
      bloc.add(
        SendEvent(information),
      );
    }
  }

  void _onSave(Key key, String value) {
    _formResult[key] = value;
  }

  @override
  Widget build(BuildContext context) {
    const padding = SizedBox(
      height: 10,
    );
    final localization = context.localization();
    final ITheme theme = ThemeBloc.getCurrentTheme(context);
    final TextTheme textTheme = theme.getTheme().textTheme;
    return ScaffoldMyApp(
      appBarTitle: localization.titleContactUs,
      body: ContactScreenBloc.build(builder: (context, state) {
        Widget saveButton = state is LoadingState
            ? _loadingButton(context)
            : _activeButton(context);
        return Center(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    IconTextFormField(
                      key: _name,
                      title: localization.titleName,
                      validator: (value) =>
                          _nullOrEmptyValidate(context, value),
                      onSaved: _onSave,
                    ),
                    IconTextFormField(
                      key: _email,
                      title: localization.titleEmail,
                      validator: (value) => _mailValidate(context, value),
                      onSaved: _onSave,
                    ),
                    IconTextFormField(
                      key: _message,
                      title: localization.titleMessage,
                      validator: (value) =>
                          _nullOrEmptyValidate(context, value),
                      onSaved: _onSave,
                    )
                  ],
                ),
              ),
              padding,
              Visibility(
                visible: state is ErrorState,
                child: Text(
                  localization.titleError,
                  style: textTheme.bodyMedium?.copyWith(
                    color: theme.getTheme().colorScheme.error,
                  ),
                ),
              ),
              padding,
              saveButton,
            ],
          ),
        );
      }),
    );
  }

  Widget _activeButton(BuildContext context) {
    final localization = context.localization();
    return ElevatedButton(
      onPressed: () => _sendPress(context),
      child: Text(localization.titleSend),
    );
  }

  Widget _loadingButton(BuildContext context) {
    final localization = context.localization();
    return ElevatedButton(
      onPressed: null,
      child: Text(
        localization.titleWait,
      ),
    );
  }
}

extension _GetNotNull<Key, String> on Map<Key, String> {
  String getNotNullString(Key key) {
    String? result = this[key];
    if (result == null) {
      throw Exception('Value is null');
    }
    return result;
  }
}
