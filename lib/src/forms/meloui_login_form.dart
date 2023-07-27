import 'package:flutter/material.dart';
import 'package:melo_ui/src/extensions/http_error_field_extension.dart';
import 'package:melo_ui/src/models/meloui_http_error_field_model.dart';
import 'package:melo_ui/src/widgets/meloui_button.dart';
import 'package:melo_ui/src/widgets/meloui_text.dart';
import 'package:melo_ui/src/widgets/meloui_text_field.dart';

class MeloUILoginForm extends StatelessWidget {
  const MeloUILoginForm(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.emailController,
      required this.passwordController,
      this.isBusy = false,
      this.isPermittedCreateAccount = true,
      required this.onRefresh,
      required this.onSubmit,
      required this.errors});

  final String title;
  final String subTitle;
  final bool isPermittedCreateAccount;
  final bool isBusy;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final List<MeloUIHttpErrorFieldModel> errors;
  final Function onRefresh;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MeloUIText(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 8,
      ),
      MeloUIText(
        subTitle,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 24,
      ),
      MeloUITextField(
        label: 'E-mail',
        placeholder: 'Digite o seu e-mail',
        error: errors.getFirstErrorByKey('email'),
        controller: emailController,
        onChanged: (String? value) {
          onRefresh();
        },
      ),
      MeloUITextField(
        label: 'Senha',
        placeholder: 'Digite a sua senha',
        isPassword: true,
        error: errors
            .getFirstErrorByKey('password')
            ?.replaceAll('password', 'senha'),
        controller: passwordController,
        onChanged: (String? value) {
          onRefresh();
        },
      ),
      MeloUIButton(
          title: 'Entrar',
          isDisabled:
              emailController.text.isEmpty || passwordController.text.isEmpty,
          isLoading: isBusy,
          onPressed: onSubmit),
      if (isPermittedCreateAccount)
        Center(
          child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/terms'),
              child: const Text(
                "Ainda não tem conta? Crie uma agora!",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
        )
    ]);
  }
}
