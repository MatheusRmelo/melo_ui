import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

Future<bool?> meloUIDeleteDialog(BuildContext context,
    {required String title,
    required String question,
    String buttonText = 'Excluir'}) async {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return MeloUIDeleteDialogWidget(
        question: question,
        title: title,
        buttonText: buttonText,
      );
    },
  );
}
