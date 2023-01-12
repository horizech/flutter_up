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
          col.add(
            r.row[index],
          );
        }
        columns.add(col);
      }

      debugPrint(columns.toString());
    }
  }

  Widget getAllColumnRows(List<dynamic> columnRow) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnRow
          .map(
            (e) => Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 10.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                decoration: const BoxDecoration(
                    // color: widget.isHeader && columnRow[0]
                    //     ? UpStyle.getTableHeaderColor(context,
                    //         style: widget.style, colorType: widget.colorType)
                    //     : Colors.grey[200],
                    // border: widget.isHeader
                    //     ? Border.all(color: Colors.grey)
                    //     : const Border(
                    //         bottom: BorderSide(
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    ),
                child: Text(
                  e.toString(),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: const BoxDecoration(
            // color: UpStyle.getTableHeaderColor(context,
            //     style: style, colorType: colorType),
            ),
        child: Row(
          children: columns
              .map(
                (e) => Expanded(
                  child: Container(child: getAllColumnRows(e)),
                ),
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
      ),
    );
  }
}
