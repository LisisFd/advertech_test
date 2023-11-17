import 'package:app_main/config/config.dart';
import 'package:equatable/equatable.dart';

sealed class ThemeState extends Equatable {
  final ITheme theme;
  const ThemeState(this.theme);
  @override
  List<Object?> get props => [theme];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.theme);
}

class ThemeUpdateState extends ThemeState {
  const ThemeUpdateState(super.theme);
}
