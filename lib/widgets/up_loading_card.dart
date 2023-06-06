import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/widgets/up_circualar_progress.dart';

class UpLoadingCard extends StatefulWidget {
  final String text;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintcolor;
  final bool borderOnForeground;
  final double? cardWidth;
  final double? cardheight;

  const UpLoadingCard({
    Key? key,
    required this.text,
    this.shape,
    this.color,
    this.margin,
    this.shadowColor,
    this.surfaceTintcolor,
    this.borderOnForeground = true,
    this.cardWidth,
    this.cardheight,
  }) : super(key: key);

  @override
  UpLoadingCardState createState() => UpLoadingCardState();
}

class UpLoadingCardState extends State<UpLoadingCard> {
  UpLoadingCardState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: UpConfig.of(context).theme.baseColor.shade50,
      child: Center(
        child: Card(
          shape: widget.shape,
          margin: widget.margin,
          color: widget.color,
          shadowColor: widget.shadowColor,
          surfaceTintColor: widget.surfaceTintcolor,
          borderOnForeground: widget.borderOnForeground,
          child: SizedBox(
            width: widget.cardWidth ?? 256,
            height: widget.cardheight ?? 64,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: UpCircularProgress(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(widget.text)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
