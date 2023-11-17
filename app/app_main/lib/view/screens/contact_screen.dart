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

  void _onChanged(Key key, String value, BuildContext context) {
    _formResult[key] = value;
    FormState? formState = _formKey.currentState;
    if (formState == null) return;
    ContactScreenBloc bloc = BlocProvider.of<ContactScreenBloc>(context);
    if (formState.validate()) {
      bloc.add(const CompleteEvent());
    } else {
      bloc.add(const ResetEvent());
    }
  }

  void _sendPress(BuildContext context) {
    ContactScreenBloc bloc = BlocProvider.of<ContactScreenBloc>(context);
    bloc.add(const CompleteEvent());
    FormContactInformation information = FormContactInformation(
      name: _formResult.getNotNullString(_name),
      email: _formResult.getNotNullString(_email),
      message: _formResult.getNotNullString(_message),
    );
    bloc.add(
      SendEvent(information),
    );
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
            : state is InitialState
                ? _disableButton(context)
                : _activeButton(context);
        Widget postStatus = state is ErrorState
            ? Text(
                localization.titleError,
                style: textTheme.bodyMedium?.copyWith(
                  color: theme.getTheme().colorScheme.error,
                ),
              )
            : state is SuccessState
                ? Text(
                    localization.titleSuccess,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.green,
                    ),
                  )
                : const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    padding,
                    IconTextFormField(
                      key: _name,
                      title: localization.titleName,
                      validator: (value) =>
                          _nullOrEmptyValidate(context, value),
                      onChanged: (key, value) =>
                          _onChanged(key, value, context),
                    ),
                    padding,
                    IconTextFormField(
                      key: _email,
                      title: localization.titleEmail,
                      validator: (value) => _mailValidate(context, value),
                      onChanged: (key, value) =>
                          _onChanged(key, value, context),
                    ),
                    padding,
                    IconTextFormField(
                      key: _message,
                      title: localization.titleMessage,
                      validator: (value) =>
                          _nullOrEmptyValidate(context, value),
                      onChanged: (key, value) =>
                          _onChanged(key, value, context),
                    ),
                    padding,
                  ],
                ),
              ),
              padding,
              Visibility(
                  visible: state is ErrorState || state is SuccessState,
                  child: postStatus),
              padding,
              SizedBox(
                width: double.maxFinite,
                child: saveButton,
              ),
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

  Widget _disableButton(BuildContext context) {
    final localization = context.localization();
    return ElevatedButton(
      onPressed: null,
      child: Text(localization.titleSend),
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
