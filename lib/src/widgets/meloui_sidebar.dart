import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';
import 'package:melo_ui/src/models/meloui_nav_item_model.dart';

class MeloUISidebar extends StatelessWidget {
  const MeloUISidebar({
    super.key,
    required this.logo,
    this.active = 0,
    this.onNavigateTo,
    this.menus,
    this.actions,
    this.width = 200,
    this.height = double.infinity,
    this.backgroundColor,
  });

  final double width;
  final double height;
  final int active;
  final Color? backgroundColor;
  final MeloUILogo logo;
  final List<MeloUINavItemModel>? menus;
  final List<Widget>? actions;
  final void Function(int page)? onNavigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
      ),
      child: Column(children: [
        logo,
        const SizedBox(
          height: 32,
        ),
        Expanded(
            flex: 5,
            child: menus == null && onNavigateTo != null
                ? Container()
                : ListView.builder(
                    itemCount: menus!.length,
                    itemBuilder: (context, index) => MeloUINavItem(
                        isActived: active == index,
                        icon: menus![index].icon,
                        name: menus![index].name,
                        onPressed: () {
                          onNavigateTo!(index);
                        }),
                  )),
        Expanded(
          flex: 1,
          child: actions == null
              ? Container()
              : Column(
                  children: actions!,
                ),
        )
      ]),
    );
  }
}
