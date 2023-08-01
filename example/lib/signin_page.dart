import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MeloUISignPage(
      title: 'Teste título',
      subTitle: 'Teste subtitulo',
      errors: const [],
      isBusy: false,
      onSubmit: (email, password) {
        meloUIDeleteDialog(context, question: 'teste', title: 'teste');
      },
    );
  }
}
