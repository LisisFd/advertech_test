import 'package:app_main/domain/domain.dart';
import 'package:app_main/logic/dependency_injection/dependency_injection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'entities/entities.dart';

part 'event.dart';
part 'state.dart';

class ContactScreenBloc extends Bloc<ContactScreenEvent, ContactScreenState> {
  late final IApiService _apiService;

  static Widget build({
    required Widget Function(BuildContext context, ContactScreenState state)
        builder,
  }) {
    return BlocBuilder<ContactScreenBloc, ContactScreenState>(
      builder: builder,
    );
  }

  ContactScreenBloc({required IApiService apiService}) : super(InitialState()) {
    _apiService = apiService;
    on<ResetEvent>((event, emit) {
      emit(InitialState());
    });
    on<SendEvent>(_sendProcessing);
  }

  Future<void> _sendProcessing(
      SendEvent event, Emitter<ContactScreenState> emit) async {
    emit(LoadingState());
    FormContactInformation information = event.formContactInformation;
    Contact contact = Contact(
        name: information.name,
        email: information.email,
        message: information.message);
    bool result = await _apiService.post(contact);
    if (result) {
      emit(SuccessState());
    } else {
      emit(ErrorState());
    }
  }
}

extension ContactScreenBlocExtension on ControllersSetUp {
  addContactScreenBloc() {
    final ServicesSetUp servicesSetUp = ServicesSetUp.instance;
    final IApiService apiService = servicesSetUp.getService<IApiService>();
    addProvider<ContactScreenBloc>(
      (context) => ContactScreenBloc(apiService: apiService),
    );
  }
}
