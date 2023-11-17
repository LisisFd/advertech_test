part of 'bloc.dart';

abstract class NavigationEvent {
  const NavigationEvent();
}

final class ContactScreenNavigate extends NavigationEvent {
  const ContactScreenNavigate();
}
