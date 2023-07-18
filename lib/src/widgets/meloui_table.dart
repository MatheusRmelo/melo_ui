import 'package:flutter/material.dart';

class MeloUITable extends StatelessWidget {
  const MeloUITable({super.key, required this.columns, required this.rows});
  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: DataTable(
          border: TableBorder.all(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.secondary),
          columns: columns,
          rows: rows),
    );
  }
}
