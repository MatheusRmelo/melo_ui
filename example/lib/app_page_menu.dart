import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melo_ui/melo_ui.dart';

class AppPageMenu extends StatelessWidget {
  const AppPageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      MeloUISidebarV2(
        height: MediaQuery.sizeOf(context).height * 0.96,
        width: MediaQuery.sizeOf(context).width * 0.08,
        logo: MeloUILogo(
          child: SvgPicture.asset('assets/login_banner.svg'),
        ),
        actions: [],
        active: 0,
        onNavigateTo: (page) {
          print(page);
        },
        menus: [
          MeloUINavItemModel(
            icon: Icons.home,
            name: 'Home',
          ),
          MeloUINavItemModel(
            icon: Icons.person,
            name: 'Profile',
          ),
          MeloUINavItemModel(
            icon: Icons.settings,
            name: 'Settings',
          ),
          MeloUINavItemModel(
            icon: Icons.logout,
            name: 'Logout',
          ),
        ],
      ),
    ]);
  }
}
