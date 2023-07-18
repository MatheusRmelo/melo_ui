import 'package:flutter/material.dart';
import 'package:melo_ui/src/widgets/containers/meloui_table_container.dart';
import 'package:melo_ui/src/widgets/meloui_button.dart';
import 'package:melo_ui/src/widgets/meloui_text_field.dart';

class MeloUIAppContainer extends StatelessWidget {
  const MeloUIAppContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: MeloUITextField(
                label: 'Pesquise',
                placeholder: 'Digite sua busca',
                suffixIcon: Icon(Icons.search_rounded),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(child: Align(child: Text('PROFILE')))
          ],
        ),
        Expanded(child: child)
      ]),
    );
  }
}
