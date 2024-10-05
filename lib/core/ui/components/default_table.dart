import 'package:flutter/material.dart';

class DefaultTable extends StatefulWidget {
  final List<Widget> columns;
  final List<List<Widget>> rows;

  const DefaultTable({super.key, required this.columns, required this.rows});

  @override
  State<DefaultTable> createState() => _DefaultTableState();
}

class _DefaultTableState extends State<DefaultTable> {
  get columns => widget.columns;
  get rows => widget.rows;

  @override
  Widget build(BuildContext context) {
    int count = 0;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return DataTable(columns: [
      DataColumn(
          label: Text(
        '#',
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      )),
      for (var column in columns) DataColumn(label: column),
    ], rows: [
      for (var row in rows)
        DataRow(
          cells: [
            DataCell(Text(
              '${++count}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            )),
            for (var cell in row) DataCell(cell)
          ],
        )
    ]);
  }
}
