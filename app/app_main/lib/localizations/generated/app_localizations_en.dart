import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'appTest';

  @override
  String get titleCardPeriod => 'Track my period';

  @override
  String get descriptionCardPeriod => 'contraception and wellbeing';

  @override
  String get titleCardPregnant => 'Get pregnant';

  @override
  String get descriptionCardPregnant => 'learn about reproductive health';

  @override
  String get titleBirthDay => 'Log in your date of birth';

  @override
  String get titleButtonNext => 'Next';
}
