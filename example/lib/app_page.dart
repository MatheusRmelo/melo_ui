import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:melo_ui/melo_ui.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MeloUIAppPage(
      title: 'Test',
      body: MeloUIAppContainer(
          child: MeloUITable(
              currentPage: 1,
              totalPages: 1,
              nextPage: () {},
              prevPage: () {},
              // tableTitle: 'Título',
              // filters: const [],
              // actions: const [],
              columns: const [
                DataColumn(label: Text("Número de rastreio")),
                DataColumn(label: Text("Nome do produto")),
                DataColumn(label: Text("Preço")),
                DataColumn(label: Text("Receive QTD")),
                DataColumn(label: Text("Data")),
              ],
              rows: List.generate(
                  100,
                  (index) => DataRow(cells: [
                        DataCell(Text('teste')),
                        DataCell(Text('teste')),
                        DataCell(Text('teste')),
                        DataCell(Text('teste')),
                        DataCell(Text('teste'))
                      ])))),
      menus: [MeloUINavItemModel(icon: Icons.dangerous, name: 'Perigo')],
      actions: [MeloUIButton(title: 'Sair', onPressed: () {})],
      logo: MeloUILogo(
        child: SvgPicture.asset('assets/login_banner.svg'),
      ),
    );
  }
}
