import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpTable extends StatelessWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final List<String> columns;

  const UpTable({
    super.key,
    required this.columns,
    this.colorType,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: UpStyle.getTableHeaderColor(context,
                style: style, colorType: colorType)),
        child: Row(
          children: [
            ...columns.map((e) => Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: 10, left: 40),
                      height: 40,
                      child: Text(
                        e,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
