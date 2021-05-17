import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/core/extensions/context_extension.dart';
import 'package:flutter_ui_workshop/app/form/form_cubit.dart';
import 'package:flutter_ui_workshop/app/form/form_page_state.dart';
import 'package:flutter_ui_workshop/app/form/widgets/app_text_form_field.dart';

class FormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext _) {
    return BlocProvider<FormCubit>(
      create: (_) => FormCubit(),
      child: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocListener<FormCubit, FormPageState>(
              listenWhen: (previous, current) {
                if (previous.isRegistering && !current.isRegistering) {
                  Navigator.of(context).pop();
                }

                if (previous.errorMessage != current.errorMessage &&
                    current.errorMessage != null) {
                  context.showSnackBar(
                    content: Text(current.errorMessage ?? ""),
                  );
                }

                if (!previous.didRegister && current.didRegister) {
                  context.showSnackBar(
                    content: const Text("Formulário submetido com sucesso!"),
                  );
                }

                return previous != current;
              },
              listener: (context, state) {
                if (state.isRegistering) {
                  context.showProgressDialog(message: "Enviando...");
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextFormField(
                      label: "Nome",
                      onChanged: (value) =>
                          context.read<FormCubit>().setName(value),
                    ),
                    AppTextFormField(
                      label: "Endereço",
                      optional: true,
                      onChanged: (value) =>
                          context.read<FormCubit>().setAddress(value),
                    ),
                    AppTextFormField(
                      label: "Celular",
                      optional: true,
                      onChanged: (value) =>
                          context.read<FormCubit>().setPhone(value),
                    ),
                    AppTextFormField(
                      label: "E-mail",
                      onChanged: (value) =>
                          context.read<FormCubit>().setEmail(value),
                    ),
                    AppTextFormField(
                      label: "Senha",
                      obscureText: true,
                      onChanged: (value) =>
                          context.read<FormCubit>().setPassword(value),
                    ),
                    AppTextFormField(
                      label: "Confirmação de Senha",
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) => context
                          .read<FormCubit>()
                          .setPasswordConfirmation(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          focusNode: FocusNode(canRequestFocus: false),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<FormCubit>().submit();
                            }
                          },
                          child: const Text("Enviar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
