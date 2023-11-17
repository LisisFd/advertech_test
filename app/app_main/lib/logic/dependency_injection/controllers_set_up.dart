import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControllersSetUp {
  ControllersSetUp._constructor();
  static final ControllersSetUp instance = ControllersSetUp._constructor();

  final List<BlocProvider> _providers = [];
  void addProvider<T extends Bloc>(T Function(BuildContext context) factory) {
    _providers.add(BlocProvider<T>(create: factory));
  }

  Widget createProvidersScope({required Widget child}) {
    return MultiBlocProvider(providers: _providers, child: child);
  }
}
