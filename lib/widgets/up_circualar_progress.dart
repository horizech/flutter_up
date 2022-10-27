import 'package:flutter/material.dart';

class UpCircularProgress extends StatelessWidget {
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;

  final double strokeWidth;
  final double? value;
  final AlignmentGeometry alignment;

  const UpCircularProgress({
    Key? key,
    this.valueColor,
    this.width = 50,
    this.alignment = Alignment.center,
    this.color,
    this.backgroundColor,
    this.height = 50,
    this.strokeWidth = 4.0,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          backgroundColor: backgroundColor,
          color: color ?? Theme.of(context).primaryColor,
          strokeWidth: strokeWidth,
          value: value,
          valueColor: valueColor,
        ),
      ),
    );
  }
}
