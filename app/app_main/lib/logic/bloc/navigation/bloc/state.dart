part of 'bloc.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();
  Future<bool> onPop(BuildContext context);
  Widget getPage();
  @override
  List<Object> get props => [];
}

final class NavigationContactScreen extends NavigationState {
  @override
  Widget getPage() {
    return const ContactScreen();
  }

  @override
  Future<bool> onPop(BuildContext context) async {
    return true;
  }
}
