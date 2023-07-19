import 'package:flutter/material.dart';
import 'package:melo_ui/src/models/meloui_nav_item_model.dart';
import 'package:melo_ui/src/widgets/meloui_logo.dart';
import 'package:melo_ui/src/widgets/meloui_sidebar.dart';

class MeloUIAppPage extends StatefulWidget {
  const MeloUIAppPage({
    super.key,
    required this.logo,
    required this.body,
    this.menus,
    this.actions,
    this.active = 0,
    this.onNavigateToNav,
  });

  final MeloUILogo logo;
  final Widget body;
  final int active;
  final List<MeloUINavItemModel>? menus;
  final List<Widget>? actions;
  final void Function(int page)? onNavigateToNav;

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
            active: widget.active,
            onNavigateTo: widget.onNavigateToNav,
            menus: widget.menus),
        Expanded(child: widget.body)
      ]),
    );
  }
}
