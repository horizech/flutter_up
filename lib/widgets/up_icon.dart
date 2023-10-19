import 'package:flutter/cupertino.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpIcon extends StatelessWidget {
  final IconData icon;
  final UpColorType? colorType;
  final UpStyle? style;
  final String? semanticLabel;
  final List<Shadow>? shadows;
  final Function()? onTap;
  const UpIcon({
    Key? key,
    required this.icon,
    this.semanticLabel,
    this.colorType,
    this.onTap,
    this.style,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color:
            UpStyle.getIconColor(context, style: style, colorType: colorType),
        semanticLabel: semanticLabel,
        shadows: shadows,
        size: UpStyle.getIconSize(context, style: style, colorType: colorType),
      ),
    );
  }
}
