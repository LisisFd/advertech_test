import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'appTest';

  @override
  String get titleContactUs => 'Contact Us';

  @override
  String get titleName => 'Name';

  @override
  String get titleEmail => 'Email';

  @override
  String get titleMessage => 'Message';

  @override
  String get titleSend => 'Send';

  @override
  String get titleWait => 'Please wait';

  @override
  String get titleError => 'Error';

  @override
  String get errorRequiredField => 'This field is required';

  @override
  String get errorIncorrectEmail => 'Email is incorrect';
}
