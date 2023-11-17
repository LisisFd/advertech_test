import 'package:app_main/config/config.dart';
import 'package:app_main/logic/dependencyInjection/controllers_set_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const ITheme _initialTheme = LightTheme();
  static ITheme getCurrentTheme(BuildContext context) {
    return BlocProvider.of<ThemeBloc>(context).state.theme;
  }

  static Widget build({
    required Widget Function(BuildContext context, ThemeState state) builder,
  }) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: builder,
    );
  }

  ThemeBloc() : super(const ThemeInitial(_initialTheme)) {
    on<ThemeUpdateEvent>((event, emit) {
      ITheme theme = state.theme;
      if (theme is DarkTheme) {
        theme = const LightTheme();
      } else {
        theme = const DarkTheme();
      }
      emit(ThemeUpdateState(theme));
    });
  }
}

extension ThemeBlocExtension on ControllersSetUp {
  addThemeProvider() {
    addProvider<ThemeBloc>((context) => ThemeBloc());
  }
}
