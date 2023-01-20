import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/models/up_row.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpTable extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final List<String> columns;
  final List<UpRow> rows;
  final bool isLastRowFooter;
  final bool showCheckboxColumn;
  final Function? onSelectChanged;

  const UpTable({
    super.key,
    this.showCheckboxColumn = false,
    this.isLastRowFooter = false,
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
  Color _getFooterRowColor(Set<MaterialState> states) {
    return UpStyle.getTableFooterColor(
      context,
      style: widget.style,
      colorType: widget.colorType,
    );
  }

  Color getDataRowColor(Set<MaterialState> states, {Color? rowColor}) {
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
    return rowColor ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: UpStyle.getTableBorderColor(context,
              style: widget.style, colorType: widget.colorType),
          width: UpStyle.getButtonBorderWidth(context,
              style: widget.style, colorType: widget.colorType),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            UpStyle.getButtonBorderRadius(
              context,
              style: widget.style,
              colorType: widget.colorType,
            ),
          ), //                 <--- border radius here
        ),
      ),
      child: DataTable(
        columnSpacing: 5,
        horizontalMargin: 10,
        showCheckboxColumn: widget.showCheckboxColumn,
        dataRowColor: MaterialStateColor.resolveWith(
          ((states) => (getDataRowColor(states, rowColor: Colors.transparent))),
        ),
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
              label: Text(
                e,
                style: TextStyle(
                    color: UpStyle.getTableHeaderTextColor(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                )),
              ),
            ),
          )
        ],
        rows: <DataRow>[
          ...widget.rows.asMap().entries.map(
                (e) => DataRow(
                  color:
                      widget.isLastRowFooter && e.key == widget.rows.length - 1
                          ? MaterialStateColor.resolveWith(_getFooterRowColor)
                          : MaterialStateColor.resolveWith(
                              ((states) => (getDataRowColor(
                                    states,
                                    rowColor: e.value.rowColor,
                                  ))),
                            ),
                  onSelectChanged: (value) {
                    debugPrint(value.toString());
                    if (widget.onSelectChanged != null) {
                      widget.onSelectChanged!(e.key);
                    }
                  },
                  cells: <DataCell>[
                    ...e.value.row.map(
                      (c) => DataCell(c),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
