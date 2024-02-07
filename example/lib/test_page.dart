import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

class TestPage extends StatelessWidget {
  final Widget testWidget = MeloUIHourField(
    label: 'Data',
    controller: TextEditingController(),
  );
  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(200),
        child: Center(
          child: testWidget,
        ),
      ),
    );
  }
}
