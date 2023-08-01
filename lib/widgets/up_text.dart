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
  final bool isSelectable;
  final int? maxLines;
  const UpText(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.colorType,
    this.isSelectable = false,
    this.style,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelectable
        ? SizedBox(
            child: Stack(
              children: [
                SelectableText(
                  text,
                  style: TextStyle(
                    decoration: UpStyle.getTextDecoration(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontStyle: UpStyle.getTextFontStyle(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontWeight: UpStyle.getTextFontWeight(
                      context,
                      style: style,
                      textType: type,
                      colorType: colorType,
                    ),
                    fontSize: UpStyle.getTextSize(
                      context,
                      style: style,
                      colorType: colorType,
                      textType: type,
                    ),
                    foreground: Paint()
                      ..color = UpStyle.getTextStrokeColor(
                        context,
                        style: style,
                        colorType: colorType,
                      )
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = UpStyle.getTextStrokeWidth(
                        context,
                        style: style,
                        colorType: colorType,
                      ),
                  ),
                ),
                SelectableText(
                  text,
                  style: TextStyle(
                    decoration: UpStyle.getTextDecoration(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontStyle: UpStyle.getTextFontStyle(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontSize: UpStyle.getTextSize(
                      context,
                      style: style,
                      colorType: colorType,
                      textType: type,
                    ),
                    backgroundColor: UpStyle.getTextBackgroundColor(
                      context,
                      colorType: colorType,
                      style: style,
                    ),
                    overflow: overflow,
                    color: UpStyle.getTextColor(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontWeight: UpStyle.getTextFontWeight(
                      context,
                      style: style,
                      colorType: colorType,
                      textType: type,
                    ),
                  ),
                )
              ],
            ),
          )
        : SizedBox(
            child: Stack(
              children: [
                Text(
                  maxLines: maxLines,
                  text,
                  style: TextStyle(
                    decoration: UpStyle.getTextDecoration(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    overflow: overflow,
                    fontStyle: UpStyle.getTextFontStyle(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontWeight: UpStyle.getTextFontWeight(
                      context,
                      style: style,
                      textType: type,
                      colorType: colorType,
                    ),
                    fontSize: UpStyle.getTextSize(
                      context,
                      style: style,
                      colorType: colorType,
                      textType: type,
                    ),
                    foreground: Paint()
                      ..color = UpStyle.getTextStrokeColor(
                        context,
                        style: style,
                        colorType: colorType,
                      )
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = UpStyle.getTextStrokeWidth(
                        context,
                        style: style,
                        colorType: colorType,
                      ),
                  ),
                ),
                Text(
                  text,
                  maxLines: maxLines,
                  style: TextStyle(
                    decoration: UpStyle.getTextDecoration(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontStyle: UpStyle.getTextFontStyle(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontSize: UpStyle.getTextSize(
                      context,
                      style: style,
                      colorType: colorType,
                      textType: type,
                    ),
                    backgroundColor: UpStyle.getTextBackgroundColor(
                      context,
                      colorType: colorType,
                      style: style,
                    ),
                    overflow: overflow,
                    color: UpStyle.getTextColor(
                      context,
                      style: style,
                      colorType: colorType,
                    ),
                    fontWeight: UpStyle.getTextFontWeight(
                      context,
                      style: style,
                      colorType: colorType,
                      textType: type,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
