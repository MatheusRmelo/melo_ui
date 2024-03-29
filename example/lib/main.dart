import 'package:example/test_page.dart';
import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MeloUITheme.generateTheme(),
      home: Material(color: Colors.grey, child: TestPage()),
    );
  }
}
