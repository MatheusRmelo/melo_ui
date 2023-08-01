import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';
import 'package:melo_ui/src/models/meloui_nav_item_model.dart';
import 'package:melo_ui/src/widgets/meloui_logo.dart';
import 'package:melo_ui/src/widgets/meloui_sidebar.dart';

class MeloUIAppPage extends StatefulWidget {
  const MeloUIAppPage({
    super.key,
    required this.logo,
    required this.body,
    this.title,
    this.menus,
    this.actions,
    this.active = 0,
    this.onNavigateToNav,
  });

  final MeloUILogo logo;
  final Widget body;
  final int active;
  final String? title;
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
      appBar: MediaQuery.of(context).size.width < 767 ? AppBar() : null,
      drawer: MediaQuery.of(context).size.width < 767
          ? Drawer(
              child: ListView(
              padding: EdgeInsets.zero,
              children: [
                if (widget.title != null)
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: MeloUIText(
                      widget.title!,
                      color: Colors.white,
                    ),
                  ),
                for (int i = 0; i < (widget.menus ?? []).length; i++) ...{
                  ListTile(
                    key: Key("menu_$i"),
                    title: Row(
                      children: [
                        Icon(widget.menus![i].icon),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(child: Text(widget.menus![i].name)),
                      ],
                    ),
                    onTap: () {
                      if (widget.onNavigateToNav != null) {
                        widget.onNavigateToNav!(i);
                      }
                    },
                  ),
                },
              ],
            ))
          : null,
      body: Row(children: [
        if (MediaQuery.of(context).size.width > 767)
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
