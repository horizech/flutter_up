import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpCard extends StatelessWidget {
  final Widget? body;
  final Image? image;
  final Widget? header;
  final UpColorType? colorType;
  final UpStyle? style;

  const UpCard({
    Key? key,
    this.body,
    this.header,
    this.image,
    this.colorType,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Visibility(
        //   visible: image != null,
        //   child: SizedBox(
        //     width: UpStyle.getCardWidth(context,
        //         style: style, colorType: colorType),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(
        //           UpStyle.getCardRadius(context,
        //               style: style, colorType: colorType),
        //         ),
        //         topRight: Radius.circular(
        //           UpStyle.getCardRadius(context,
        //               style: style, colorType: colorType),
        //         ),
        //       ),
        //       child: image,
        //     ),
        //   ),
        // ),

        header != null
            ? Container(
                width: UpStyle.getCardWidth(context,
                    style: style, colorType: colorType),
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.3),
                  //     spreadRadius: 3,
                  //     blurRadius: 7,
                  //     offset: const Offset(0, 3),
                  //   ),
                  // ],
                  gradient: UpStyle.getCardHeaderGradient(context,
                      style: style, colorType: colorType),
                  color: UpStyle.getCardHeaderColor(context,
                      style: style, colorType: colorType),
                  borderRadius: BorderRadius.only(
                    topLeft: image != null
                        ? const Radius.circular(0)
                        : Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                    topRight: image != null
                        ? const Radius.circular(0)
                        : Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                      style != null && style!.cardHeaderPadding == false
                          ? 0
                          : 15.0),
                  child: header,
                ),
              )
            : const SizedBox.shrink(),
        body != null
            ? Container(
                width: UpStyle.getCardWidth(context,
                    style: style, colorType: colorType),
                height: UpStyle.getCardHeight(context,
                    style: style, colorType: colorType),
                decoration: BoxDecoration(
                  color: UpStyle.getCardBodyColor(context,
                      style: style, colorType: colorType),
                  gradient: UpStyle.getCardBodyGradient(context,
                      style: style, colorType: colorType),
                  borderRadius: header != null
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                          bottomRight: Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                        )
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                          bottomRight: Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                          topLeft: Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                          topRight: Radius.circular(
                            UpStyle.getCardRadius(context,
                                style: style, colorType: colorType),
                          ),
                        ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    style != null && style!.cardBodyPadding == false ? 0 : 15,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: body,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
