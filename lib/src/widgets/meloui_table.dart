import 'package:flutter/material.dart';
import 'package:melo_ui/melo_ui.dart';

class MeloUITable extends StatelessWidget {
  const MeloUITable({
    super.key,
    required this.columns,
    required this.rows,
    required this.currentPage,
    required this.totalPages,
    required this.nextPage,
    required this.prevPage,
    this.title,
    this.backgroundHeaderColor,
    this.textHeaderColor,
  });
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final String? title;
  final Color? backgroundHeaderColor;
  final Color? textHeaderColor;
  final int currentPage;
  final int totalPages;
  final VoidCallback nextPage;
  final VoidCallback prevPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: backgroundHeaderColor ??
                  Theme.of(context).colorScheme.primary.withOpacity(0.6),
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              if (title != null)
                MeloUIText(title!, color: textHeaderColor ?? Colors.white),
              const Spacer(),
              InkWell(
                  onTap: prevPage,
                  child: Icon(Icons.arrow_back_ios_rounded,
                      color: textHeaderColor ?? Colors.white)),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: MeloUIText("$currentPage/$totalPages",
                      color: textHeaderColor ?? Colors.white)),
              InkWell(
                  onTap: nextPage,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: textHeaderColor ?? Colors.white,
                  )),
            ]),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: DataTable(
                    headingRowColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary.withOpacity(0.1)),
                    headingRowHeight: 48,
                    dataRowMaxHeight: 48,
                    dataRowColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                    columns: columns,
                    rows: rows),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
