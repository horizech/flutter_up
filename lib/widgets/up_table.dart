import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/models/up_row.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpTable extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final List<String> columns;
  final List<UpRow> rows;
  final bool isLastRowFooter;
  final bool showCheckboxColumn;
  final Function? onSelectChanged;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;

  const UpTable(
      {super.key,
      this.showCheckboxColumn = false,
      this.isLastRowFooter = false,
      this.colorType,
      required this.columns,
      this.style,
      this.onSelectChanged,
      required this.rows,
      this.mouseCursor});

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
    Color? color;
    if (rowColor != null) {
      color = rowColor;
    } else {
      color = UpStyle.getTableRowColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.pressed,
    }.contains)) {
      color = UpStyle.getTableRowPressedColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.hovered,
    }.contains)) {
      color = UpStyle.getTableRowHoverColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.focused,
    }.contains)) {
      color = UpStyle.getTableRowFocusedColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    if (states.any(<MaterialState>{
      MaterialState.hovered,
    }.contains)) {
      color = UpStyle.getTableRowHoverColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      );
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DataTable(
        dividerThickness: 0,
        columnSpacing: 5,
        horizontalMargin: 10,
        showCheckboxColumn: widget.showCheckboxColumn,
        headingRowHeight: UpStyle.getTableHeadingRowHeight(context,
            style: widget.style, colorType: widget.colorType),
        dataRowMaxHeight: UpStyle.getTableRowHeight(context,
            style: widget.style, colorType: widget.colorType),
        decoration: BoxDecoration(
          border: Border.all(
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
        dataRowColor: MaterialStateColor.resolveWith(
          ((states) => (getDataRowColor(
                states,
              ))),
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
              label: UpText(
                e,
                style: UpStyle(
                  textColor: UpStyle.getTableHeaderTextColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                ),
              ),
            ),
          )
        ],
        rows: <DataRow>[
          ...widget.rows.asMap().entries.map(
                (e) => DataRow(
                  mouseCursor: widget.mouseCursor,
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
                    // debugPrint(value.toString());
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
