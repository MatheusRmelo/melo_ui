import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melo_ui/melo_ui.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MeloUIAppPage(
      body: const MeloUIAppContainer(
          child: MeloUITableContainer(filters: [], actions: [], columns: [
        DataColumn(label: Text("Número de rastreio")),
        DataColumn(label: Text("Nome do produto")),
        DataColumn(label: Text("Preço")),
        DataColumn(label: Text("Receive QTD")),
        DataColumn(label: Text("Data")),
      ], rows: [])),
      menus: [
        MeloUINavItem(
            icon: Icons.verified_user,
            name: 'Usuários verificados',
            onPressed: () {})
      ],
      actions: [MeloUIButton(title: 'Sair', onPressed: () {})],
      logo: MeloUILogo(
        child: SvgPicture.asset('assets/login_banner.svg'),
      ),
    );
  }
}
