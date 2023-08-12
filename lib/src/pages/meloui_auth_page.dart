import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

class MeloUIAuthPage extends StatefulWidget {
  const MeloUIAuthPage(
      {super.key,
      required this.title,
      required this.subTitle,
      this.picture,
      this.isBusy = false,
      required this.onSubmit,
      required this.errors});

  final Widget? picture;
  final String title;
  final String subTitle;
  final bool isBusy;
  final List<MeloUIHttpErrorFieldModel> errors;
  final void Function(String email, String password) onSubmit;
  @override
  State<MeloUIAuthPage> createState() => _MeloUIAuthPageState();
}

class _MeloUIAuthPageState extends State<MeloUIAuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: size.width * 0.05),
          child: Container(
              width: size.width * 0.3,
              margin: const EdgeInsets.symmetric(vertical: 64),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(32)),
              child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MeloUIText(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        MeloUIText(
                          widget.subTitle,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        MeloUITextField(
                          label: 'E-mail',
                          placeholder: 'Digite o seu e-mail',
                          error: widget.errors.getFirstErrorByKey('email'),
                          controller: _emailController,
                          onChanged: (String? value) {
                            setState(() {});
                          },
                        ),
                        MeloUITextField(
                          label: 'Senha',
                          placeholder: 'Digite a sua senha',
                          isPassword: true,
                          error: widget.errors
                              .getFirstErrorByKey('password')
                              ?.replaceAll('password', 'senha'),
                          controller: _passwordController,
                          onChanged: (String? value) {
                            setState(() {});
                          },
                        ),
                        MeloUIButton(
                            title: 'Entrar',
                            isDisabled: _emailController.text.isEmpty ||
                                _passwordController.text.isEmpty,
                            isLoading: widget.isBusy,
                            onPressed: () {
                              widget.onSubmit(_emailController.text,
                                  _passwordController.text);
                            }),
                        if (false)
                          Center(
                            child: TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/terms'),
                                child: const Text(
                                  "Ainda não tem conta? Crie uma agora!",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                )),
                          )
                      ]))),
        )),
      ),
    );
  }
}
