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
    return SizedBox(
      child: Stack(
        children: [
          Text(
            text,
            style: TextStyle(
              fontStyle: UpStyle.getTextFontStyle(context,
                  style: style, colorType: colorType),
              fontWeight: UpStyle.getTextFontWeight(context,
                  style: style, colorType: colorType),
              fontSize: UpStyle.getTextSize(
                context,
                style: style,
                colorType: colorType,
              ),
              foreground: Paint()
                ..color = UpStyle.getTextStrokeColor(context,
                    style: style, colorType: colorType)
                ..style = PaintingStyle.stroke
                ..strokeWidth = UpStyle.getTextStrokeWidth(context,
                    style: style, colorType: colorType),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontStyle: UpStyle.getTextFontStyle(context,
                  style: style, colorType: colorType),
              fontSize: UpStyle.getTextSize(
                context,
                style: style,
                colorType: colorType,
              ),
              backgroundColor: UpStyle.getTextBackgroundColor(
                context,
                colorType: colorType,
                style: style,
              ),
              overflow: overflow,
              color: UpStyle.getTextColor(context,
                  style: style, colorType: colorType),
              fontWeight: UpStyle.getTextFontWeight(context,
                  style: style, colorType: colorType),
            ),
          )
        ],
      ),
    );
  }
}
