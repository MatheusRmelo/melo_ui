import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

class MeloUISidebarV2 extends StatelessWidget {
  const MeloUISidebarV2({
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
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
      ),
      child: Column(children: [
        Expanded(child: logo),
        const Expanded(
          child: SizedBox(
            height: 32,
          ),
        ),
        Expanded(
            flex: 6,
            child: menus == null && onNavigateTo != null
                ? Container()
                : ListView.builder(
                    itemCount: menus!.length,
                    itemBuilder: (context, index) => MeloUINavItemV2(
                        isActived: active == index,
                        icon: menus![index].icon,
                        name: menus![index].name,
                        onPressed: () {
                          onNavigateTo!(index);
                        }),
                  )),
        const Expanded(
          child: SizedBox(
            height: 32,
          ),
        ),
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
