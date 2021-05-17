import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_page_state.freezed.dart';

@freezed
class FormPageState with _$FormPageState {
  factory FormPageState({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required bool isRegistering,
    required bool didRegister,
    String? errorMessage,
  }) = _FormPageState;

  factory FormPageState.initial() => FormPageState(
        name: "",
        address: "",
        phone: "",
        email: "",
        password: "",
        passwordConfirmation: "",
        isRegistering: false,
        didRegister: false,
      );
}
