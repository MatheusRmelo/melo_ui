import 'package:example/app_page.dart';
import 'package:example/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

import 'app_page_menu.dart';

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
      home: const Material(color: Colors.grey, child: AppPageMenu()),
    );
  }
}
