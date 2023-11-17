import 'package:app_main/logic/controllers_set_up.dart';
import 'package:app_main/view/screens/screens.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'bloc.dart';

part 'event.dart';
part 'state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  static Widget build({
    required Widget Function(BuildContext context, NavigationState state)
        builder,
  }) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: builder,
    );
  }

  NavigationBloc() : super(NavigationContactScreen()) {
    on<ContactScreenNavigate>(
      (event, emit) => emit(
        NavigationContactScreen(),
      ),
    );
  }

  static void navigateToContactScreen({
    required BuildContext context,
  }) {
    BlocProvider.of<NavigationBloc>(context).add(
      const ContactScreenNavigate(),
    );
  }
}

extension NavigationBlocExtension on ControllersSetUp {
  addNavigationProvider() {
    addProvider<NavigationBloc>((context) => NavigationBloc());
  }
}
