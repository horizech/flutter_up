import 'package:flutter/material.dart';
import 'package:flutter_up/enums/text_style.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpText extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final UpColorType? colorType;
  final UpStyle? style;
  final UpTextType? type;
  const UpText(
    this.text, {
    Key? key,
    this.overflow,
    this.colorType,
    this.style,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: UpStyle.getTextColor(
          context,
          colorType: colorType,
          style: style,
        ),
        backgroundColor: UpStyle.getTextBackgroundColor(
          context,
          colorType: colorType,
          style: style,
        ),
        fontSize: UpStyle.gettextSize(context,
            colorType: colorType, style: style, texttype: type),
        fontWeight: UpStyle.getTextFontWeight(
          context,
          colorType: colorType,
          style: style,
        ),
        overflow: overflow,
      ),
    );
  }
}
