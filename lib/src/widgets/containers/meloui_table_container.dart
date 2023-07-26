import 'package:flutter/material.dart';
import 'package:melo_ui/src/widgets/meloui_table.dart';

class MeloUITableContainer extends StatelessWidget {
  const MeloUITableContainer({
    super.key,
    required this.filters,
    required this.actions,
    required this.columns,
    required this.rows,
    required this.currentPage,
    required this.totalPages,
    required this.nextPage,
    required this.prevPage,
    this.tableTitle,
  });

  final List<Widget> filters;
  final List<Widget> actions;
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final int currentPage;
  final int totalPages;
  final VoidCallback nextPage;
  final VoidCallback prevPage;
  final String? tableTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: filters),
            ),
            const Spacer(flex: 4),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end, children: actions),
            ),
          ]),
        ),
        Expanded(
          child: MeloUITable(
              currentPage: currentPage,
              totalPages: totalPages,
              nextPage: nextPage,
              prevPage: prevPage,
              title: tableTitle,
              columns: columns,
              rows: rows),
        )
      ],
    );
  }
}
