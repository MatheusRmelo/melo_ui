import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

Future<bool?> meloUIDeleteDialog(BuildContext context,
    {required String title,
    required String question,
    String buttonText = 'Excluir'}) async {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        title: Row(children: [
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ]),
        content: SizedBox(
          width: 300,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            MeloUIText(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            MeloUIText(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ]),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          MeloUIButton(
              width: 140,
              title: 'Fechar',
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.red,
              variant: MeloUIButtonVariant.outlined),
          MeloUIButton(
              width: 140,
              title: buttonText,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.pop(context, true);
              }),
        ],
      );
    },
  );
}
