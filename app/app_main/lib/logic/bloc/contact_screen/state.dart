part of 'bloc.dart';

abstract class ContactScreenState extends Equatable {
  @override
  List<Object> get props => [];
  const ContactScreenState();
}

class InitialState extends ContactScreenState {}

class LoadingState extends ContactScreenState {}

class ErrorState extends ContactScreenState {}

class SuccessState extends ContactScreenState {}
