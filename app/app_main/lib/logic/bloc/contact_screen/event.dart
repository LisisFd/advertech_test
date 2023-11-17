part of 'bloc.dart';

abstract class ContactScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
  const ContactScreenEvent();
}

class SendEvent extends ContactScreenEvent {
  final FormContactInformation formContactInformation;
  const SendEvent(this.formContactInformation);
}

class ResetEvent extends ContactScreenEvent {
  const ResetEvent();
}
