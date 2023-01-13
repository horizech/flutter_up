import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/models/up_row.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpTable extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final bool isHeader;
  final List<UpRow> rows;
  final bool isFooter;

  const UpTable({
    super.key,
    this.isHeader = true,
    this.isFooter = false,
    this.colorType,
    this.style,
    required this.rows,
  });

  @override
  State<UpTable> createState() => _UpTableState();
}

class _UpTableState extends State<UpTable> {
  List<dynamic> columns = [];
  @override
  void initState() {
    super.initState();
    if (widget.rows.isNotEmpty) {
      for (var index = 0; index < widget.rows.first.row.length; index++) {
        List<dynamic> col = [];

        for (var r in widget.rows) {
          if (index < r.row.length) {
            col.add(
              r.row[index],
            );
          } else {
            col.add("");
          }
        }
        columns.add(col);
      }
    }
  }

  Widget getColumn(List<dynamic> columnRow) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnRow
            .asMap()
            .entries
            .map(
              (e) => Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.isHeader && e.key == 0
                            ? UpStyle.getTableHeaderColor(
                                context,
                                style: widget.style,
                                colorType: widget.colorType,
                              )
                            : UpStyle.getTableRowColor(
                                context,
                                style: widget.style,
                                colorType: widget.colorType,
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          e.value.toString(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        // color: UpStyle.getTableHeaderColor(context,
        //     style: style, colorType: colorType),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: columns
            .map(
              (e) => getColumn(e),
            )
            .toList(),
        // Container(
        //   height: 40,
        //   decoration: BoxDecoration(
        //     color: UpStyle.getTableHeaderColor(context,
        //         style: widget.style, colorType: widget.colorType),
        //   ),
        // child:

        //   ...widget.rows
        //       .map(
        //         (e) => Container(
        //           decoration: BoxDecoration(
        //             border: Border(
        //               bottom: BorderSide(
        //                   color: Colors.grey[200] ?? Colors.grey),
        //             ),
        //           ),
        //           child: const Text(""),
        //           Row(
        //             children: e.row
        //                 .asMap()
        //                 .entries
        //                 .map(
        //                   (e) => Expanded(
        //                     child: Container(
        //                       padding: const EdgeInsets.only(
        //                           top: 15,
        //                           bottom: 15,
        //                           left: 8,
        //                           right: 8),
        //                       child: Text(e.key.toString()),
        //                     ),
        //                   ),
        //                 )
        //                 .toList(),
        //           ),
        //         ),
        //       )
        //       .toList()
        // ],
        // ),
        // ),)
      ),
    );
  }
}
