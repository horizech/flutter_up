import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

import 'package:flutter_up/widgets/up_text.dart';

class UpNavDrawer extends StatelessWidget {
  final Widget? header;
  final List<Widget> body;
  final String? version;
  final UpColorType? colorType;
  final UpStyle? style;

  const UpNavDrawer({
    Key? key,
    this.header,
    this.colorType,
    this.style,
    required this.body,
    this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UpStyle.getDrawerBodyColor(
        context,
        style: style,
        colorType: colorType,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Visibility(
                      child: header != null
                          ? Container(
                              color: UpStyle.getDrawerHeaderColor(
                                context,
                                style: style,
                                colorType: colorType,
                              ),
                              child: header)
                          : const SizedBox()),
                  ...body,
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
