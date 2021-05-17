import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/form/form_page_state.dart';

class FormCubit extends Cubit<FormPageState> {
  FormCubit() : super(FormPageState.initial());

  void setName(String value) {
    emit(state.copyWith(name: value));
  }

  void setAddress(String value) {
    emit(state.copyWith(address: value));
  }

  void setPhone(String value) {
    emit(state.copyWith(phone: value));
  }

  void setEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void setPassword(String value) {
    emit(state.copyWith(password: value));
  }

  void setPasswordConfirmation(String value) {
    emit(state.copyWith(passwordConfirmation: value));
  }

  Future<void> submit() async {
    emit(state.copyWith(
      isRegistering: true,
      didRegister: false,
      errorMessage: null,
    ));

    await Future.delayed(const Duration(seconds: 2));

    final result = Random().nextBool();

    if (result) {
      emit(state.copyWith(
        didRegister: true,
        isRegistering: false,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: "Algo de errado aconteceu",
        isRegistering: false,
      ));
    }
  }
}
