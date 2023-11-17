import 'package:app_main/localization.dart';
import 'package:app_main/localizations/generated/app_localizations.dart';
import 'package:app_main/logic/bloc/contact_screen/bloc.dart';
import 'package:app_main/logic/logic.dart';
import 'package:flutter/material.dart';

void runFullApp() {
  final ControllersSetUp controllersSetUp = ControllersSetUp.instance;
  final ServicesSetUp servicesSetUp = ServicesSetUp.instance;
  _runDependencyInjection(controllersSetUp, servicesSetUp);
  runApp(const MyApp());
}

void _runDependencyInjection(
    ControllersSetUp cInstance, ServicesSetUp sInstance) {
  //Set up services
  sInstance.addApiServiceFeature();
  //Set up Bloc
  cInstance.addThemeProvider();
  cInstance.addNavigationProvider();
  cInstance.addContactScreenBloc();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllersSetUp controllersSetUp = ControllersSetUp.instance;
    Widget materialApp = ThemeBloc.build(
      builder: (context, state) {
        return MaterialApp(
          onGenerateTitle: (context) => context.localization().appName,
          theme: state.theme.getTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'),
          ],
          home: const AppNavigationWrapper(),
        );
      },
    );
    return controllersSetUp.createProvidersScope(child: materialApp);
  }
}
