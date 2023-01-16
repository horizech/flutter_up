import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpTable extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final List<String> columns;
  final List<List<dynamic>> rows;
  final bool isFooter;
  final bool showCheckboxColumn;
  final Function? onSelectChanged;

  const UpTable({
    super.key,
    this.showCheckboxColumn = false,
    this.isFooter = false,
    this.colorType,
    required this.columns,
    this.style,
    this.onSelectChanged,
    required this.rows,
  });

  @override
  State<UpTable> createState() => _UpTableState();
}

class _UpTableState extends State<UpTable> {
  Color getDataRowColor(Set<MaterialState> states) {
    if (states.any(<MaterialState>{
      MaterialState.pressed,
    }.contains)) {
      return UpStyle.getTableRowPressedColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.hovered,
    }.contains)) {
      return UpStyle.getTableRowHoverColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.focused,
    }.contains)) {
      return UpStyle.getTableRowFocusedColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.hovered,
    }.contains)) {
      return UpStyle.getTableRowHoverColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    return Colors.transparent;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 5,
      horizontalMargin: 10,
      showCheckboxColumn: widget.showCheckboxColumn,
      dataRowColor: MaterialStateColor.resolveWith(getDataRowColor),
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => UpStyle.getTableHeaderColor(
          context,
          style: widget.style,
          colorType: widget.colorType,
        ),
      ),
      columns: <DataColumn>[
        ...widget.columns.map(
          (e) => DataColumn(
            label: Text(e),
          ),
        )
      ],
      rows: <DataRow>[
        ...widget.rows.map(
          (e) => DataRow(
            onSelectChanged: (value) => {
              if (widget.onSelectChanged != null)
                {
                  widget.onSelectChanged!(e),
                }
            },
            cells: <DataCell>[
              ...e.map(
                (c) => DataCell(
                  SizedBox(
                    child: Text(
                      c.toString(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
