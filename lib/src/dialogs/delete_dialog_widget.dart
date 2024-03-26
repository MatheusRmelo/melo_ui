import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melo_ui/melo_ui.dart';

class MeloUIDeleteDialogWidget extends StatelessWidget {
  const MeloUIDeleteDialogWidget(
      {super.key,
      required this.title,
      required this.question,
      this.buttonText = 'Excluir',
      this.onClose,
      this.onDelete});
  final String title;
  final String question;
  final String buttonText;
  final VoidCallback? onClose;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      title: Row(children: [
        const Spacer(),
        IconButton(
            onPressed: onClose ??
                () {
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
          const SizedBox(
            height: 16,
          ),
          MeloUIText(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              Expanded(
                child: MeloUIButton(
                    title: 'Fechar',
                    onPressed: onClose ??
                        () {
                          Navigator.pop(context);
                        },
                    backgroundColor: Colors.red,
                    variant: MeloUIButtonVariant.outlined),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: MeloUIButton(
                    title: buttonText,
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    onPressed: onDelete ??
                        () {
                          Navigator.pop(context, true);
                        }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
