import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

import 'package:flutter_up/widgets/up_text.dart';

class UpNavDrawer extends StatelessWidget {
  final List<Widget> children;
  final String? version;
  final UpColorType? colorType;
  final UpStyle? style;

  const UpNavDrawer({
    Key? key,
    this.colorType,
    this.style,
    required this.children,
    this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: UpStyle.getDrawerShadowColor(
        context,
        style: style,
        colorType: colorType,
      ),
      shape: UpStyle.getDrawerShape(
        context,
        style: style,
        colorType: colorType,
      ),
      backgroundColor: UpStyle.getDrawerColor(
        context,
        style: style,
        colorType: colorType,
      ),
      surfaceTintColor: UpStyle.getDrawerSurfaceTintColor(
        context,
        style: style,
        colorType: colorType,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: UpStyle.getDrawerColor(
            context,
            style: style,
            colorType: colorType,
          ),
          gradient: UpStyle.getDrawerGradient(
            context,
            style: style,
            colorType: colorType,
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ...children,
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UpText(version ?? ""),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
