import 'package:app_main/logic/logic.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc.dart';

class AppNavigationWrapper extends StatelessWidget {
  const AppNavigationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBloc.build(
      builder: (context, state) {
        MaterialPage page = MaterialPage(
          child: state.getPage(),
        );
        return WillPopScope(
          onWillPop: () async {
            var result = state.onPop(context);
            return result;
          },
          child: Navigator(
            pages: [page],
            onPopPage: (route, result) {
              return false;
            },
          ),
        );
      },
    );
  }
}
