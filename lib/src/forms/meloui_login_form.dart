import 'package:flutter/material.dart';
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
      required this.onRefresh,
      required this.onSubmit,
      required this.errors});

  final String title;
  final String subTitle;
  final bool isBusy;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Map<String, List<dynamic>> errors;
  final Function onRefresh;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MeloUIText(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 8,
      ),
      MeloUIText(
        subTitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 24,
      ),
      MeloUITextField(
        label: 'E-mail',
        placeholder: 'Digite o seu e-mail',
        error:
            errors['email'] != null ? (errors['email']!.first as String) : null,
        controller: emailController,
        onChanged: (String? value) {
          onRefresh();
        },
      ),
      MeloUITextField(
        label: 'Senha',
        placeholder: 'Digite a sua senha',
        isPassword: true,
        error: errors['password'] != null
            ? (errors['password']!.first as String)
                .replaceAll('password', 'senha')
            : null,
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
