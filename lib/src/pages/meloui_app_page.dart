import 'package:flutter/material.dart';
import 'package:melo_ui/src/widgets/meloui_logo.dart';
import 'package:melo_ui/src/widgets/meloui_sidebar.dart';

class MeloUIAppPage extends StatefulWidget {
  const MeloUIAppPage({
    super.key,
    required this.logo,
    required this.body,
    this.menus,
    this.actions,
  });

  final MeloUILogo logo;
  final Widget body;
  final List<Widget>? menus;
  final List<Widget>? actions;
  @override
  State<MeloUIAppPage> createState() => _MeloUIAppPageState();
}

class _MeloUIAppPageState extends State<MeloUIAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        MeloUISidebar(
            width: 300,
            logo: widget.logo,
            actions: widget.actions,
            menus: widget.menus),
        Expanded(child: widget.body)
      ]),
    );
  }
}
