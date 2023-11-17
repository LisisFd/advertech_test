import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class LocaleListenerWidget extends StatefulWidget {
  final Locale defaultLocale;
  final Widget? child;

  const LocaleListenerWidget(
      {super.key, this.defaultLocale = const Locale('en_US'), this.child});

  @override
  State<LocaleListenerWidget> createState() => _LocaleListenerWidgetState();
}

class _LocaleListenerWidgetState extends State<LocaleListenerWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void _updateLocale() async {
    await initializeDateFormatting();
    if (mounted) {
      Intl.defaultLocale = Localizations.localeOf(context).languageCode;
    }
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    _updateLocale();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}
