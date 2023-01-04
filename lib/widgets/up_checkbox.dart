import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpCheckbox extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final String? label;
  final Function? onChange;
  final UpTextDirection labelDirection;
  bool? initialValue;
  final Color? activeColor;
  final Color? checkColor;
  final bool isRounded;
  final double roundedBorderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool isDisable;

  UpCheckbox({
    Key? key,
    this.initialValue = false,
    this.label,
    this.colorType,
    this.style,
    this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.activeColor,
    this.checkColor,
    this.isRounded = false,
    this.isDisable = false,
    this.roundedBorderRadius = 10,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  State<UpCheckbox> createState() => _UpCheckboxState();
}

class _UpCheckboxState extends State<UpCheckbox> {
  final int _enterCounter = 0;
  final int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  bool isHovered = false;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      isHovered = true;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      isHovered = false;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      isHovered = true;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Visibility(
          visible: widget.labelDirection == UpTextDirection.left,
          child: Text(widget.label ?? ""),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: _incrementEnter,

          // onHover: _updateLocation,
          onExit: _incrementExit,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: isHovered
                  ? UpStyle.getHoverBackgroundColor(context,
                      style: widget.style, colorType: widget.colorType)
                  : UpStyle.getBackgroundColor(context,
                      style: widget.style, colorType: widget.colorType),
              // border: Border.all(
              //   style: BorderStyle.solid,
              //   color: isHovered
              //       ? UpStyle.getHoverBorderColor(context,
              //           style: widget.style, colorType: widget.colorType)
              //       : UpStyle.getBorderColor(context,
              //           style: widget.style, colorType: widget.colorType),
              //   width: UpStyle.getBorderWidth(context,
              //       style: widget.style, colorType: widget.colorType),
              // ),
            ),
            child: Center(
              child: Checkbox(
                  // focusColor: Colors.red,
                  // overlayColor: MaterialStateProperty.resolveWith<Color>(
                  //   (Set<MaterialState> states) {
                  //     return UpStyle.getHoverBackgroundColor(
                  //       context,
                  //       style: widget.style,
                  //       colorType: widget.colorType,
                  //     );
                  //   },
                  // ),

                  shape: UpStyle.getRoundedRectangleBorder(context,
                      style: widget.style, colorType: widget.colorType),
                  value: widget.initialValue,
                  activeColor: UpStyle.getForegroundColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                  checkColor: UpStyle.getBackgroundColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                  side: BorderSide(
                    width: UpStyle.getBorderWidth(
                      context,
                      style: widget.style,
                      colorType: widget.colorType,
                    ),
                    color: UpStyle.getBorderColor(
                      context,
                      style: widget.style,
                      colorType: widget.colorType,
                    ),
                  ),
                  onChanged: (bool? newCheck) {
                    if (!(widget.style?.isDisabled ?? false)) {
                      setState(() {
                        widget.initialValue = newCheck ?? false;
                      });

                      if (widget.onChange != null) {
                        widget.onChange!(newCheck);
                      }
                    }
                  }),
            ),
          ),
        ),
        Visibility(
          visible: widget.labelDirection == UpTextDirection.right,
          child: Text(widget.label ?? ""),
        )
      ],
    );
  }
}
