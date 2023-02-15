import 'package:flutter/material.dart';

class UpOrientationalColumnRow extends StatelessWidget {
  final List<Widget> children;
  final List<double> widths;
  const UpOrientationalColumnRow(
      {Key? key, required this.children, this.widths = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return width > height
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widths.isNotEmpty
                ? children.asMap().entries.map<Widget>((entry) {
                    if (widths.length > entry.key && widths[entry.key] > 0) {
                      return SizedBox(
                          width: widths[entry.key], child: entry.value);
                    } else {
                      return Flexible(child: entry.value);
                    }
                  }).toList()
                : children.map<Widget>((w) => Flexible(child: w)).toList())
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          );
  }
}
