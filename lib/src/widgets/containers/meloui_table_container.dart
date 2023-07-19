import 'package:flutter/material.dart';
import 'package:melo_ui/src/widgets/meloui_table.dart';

class MeloUITableContainer extends StatelessWidget {
  const MeloUITableContainer(
      {super.key,
      required this.filters,
      required this.actions,
      required this.columns,
      required this.rows});

  final List<Widget> filters;
  final List<Widget> actions;
  final List<DataColumn> columns;
  final List<DataRow> rows;

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
          child: MeloUITable(columns: columns, rows: rows),
        )
      ],
    );
  }
}
