import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/models/up_row.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_themes.dart';
import 'package:flutter_up/widgets/up_icon.dart';
import 'package:flutter_up/widgets/up_text.dart';
import 'package:data_table_2/data_table_2.dart';

class UpTable extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final double? width;
  final double? height;
  final List<String> columns;
  final List<UpRow> rows;
  final bool isLastRowFooter;
  final bool showCheckboxColumn;
  final Function? onSelectChanged;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;
  final Function(int, bool)? onSortChange;
  final int? sortColumnIndex;
  final bool sortAscending;

  const UpTable({
    super.key,
    this.showCheckboxColumn = false,
    this.isLastRowFooter = false,
    this.colorType,
    this.sortColumnIndex,
    this.onSortChange,
    this.sortAscending = false,
    required this.columns,
    this.style,
    this.onSelectChanged,
    required this.rows,
    this.mouseCursor,
    this.width,
    this.height,
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
    return Theme(
        data: Theme.of(context).copyWith(
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: UpConfig.of(context).theme.baseColor.shade900,
              ),
        ),
        child: SizedBox(
          width: widget.width ?? MediaQuery.of(context).size.width,
          // height: widget.height ?? MediaQuery.of(context).size.width,
          child: DataTable(
            sortAscending: widget.sortAscending,
            sortColumnIndex: widget.sortColumnIndex,
            dividerThickness: 0,
            columnSpacing: 5,
            // isHorizontalScrollBarVisible: true,
            horizontalMargin: 10,
            // sortArrowIcon: Icons.arrow_upward,
            showCheckboxColumn: widget.showCheckboxColumn,
            headingRowHeight: UpStyle.getTableHeadingRowHeight(context,
                style: widget.style, colorType: widget.colorType),
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
                  onSort: (columnIndex, sortAscending) {
                    if (widget.onSortChange != null) {
                      widget.onSortChange!(columnIndex, sortAscending);
                    }
                  },
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
                      color: widget.isLastRowFooter &&
                              e.key == widget.rows.length - 1
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
        ));
  }
}
