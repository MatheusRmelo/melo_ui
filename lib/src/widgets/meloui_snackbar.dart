import 'package:flutter/material.dart';

class MeloUIErrorSnackbar extends SnackBar {
  MeloUIErrorSnackbar({
    Key? key,
    required BuildContext context,
    required Widget content,
  }) : super(
          key: key,
          content: content,
          backgroundColor: Theme.of(context).colorScheme.error,
          action: SnackBarAction(
            label: 'FECHAR',
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        );
}

class MeloUISuccessSnackbar extends SnackBar {
  MeloUISuccessSnackbar({
    Key? key,
    required BuildContext context,
    required Widget content,
  }) : super(
          key: key,
          content: content,
          backgroundColor: Colors.green,
          action: SnackBarAction(
            label: 'FECHAR',
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        );
}
