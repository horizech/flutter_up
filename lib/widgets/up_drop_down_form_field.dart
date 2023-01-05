import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/models/up_label_value.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpDropDownFieldWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final UpStyle? style;
  final UpColorType? colorType;
  String value;
  final List<UpLabelValuePair> itemList;
  final String? label;
  final bool isFlexible;
  final Function(String?)? onSaved;
  final int maxLines;
  final Function()? onTap;
  final IconData? suffixIcon;
  final IconData? icon;
  final IconData? arrowIcon;
  final IconData? prefixIcon;
  final Function()? suffixAction;
  final Function()? prefixAction;
  final Function()? iconAction;
  final Function()? arrowAction;
  final UpInputType? type;
  final String? hint;
  final bool isExpanded;

  UpDropDownFieldWidget({
    Key? key,
    this.type = UpInputType.outline,
    required this.value,
    required this.itemList,
    required this.onChanged,
    this.arrowAction,
    this.arrowIcon,
    this.hint,
    this.style,
    this.isExpanded = false,
    this.colorType,
    this.label = "",
    this.isFlexible = false,
    this.onSaved,
    this.maxLines = 1,
    this.onTap,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixAction,
    this.prefixAction,
    this.iconAction,
  }) : super(key: key);

  @override
  State<UpDropDownFieldWidget> createState() => UpDropDownFieldWidgetState();
}

class UpDropDownFieldWidgetState extends State<UpDropDownFieldWidget> {
  String? _curValue;

  changeValue(value) {
    widget.onChanged(value);
    setState(() {
      widget.value = value;
    });
  }

  List<DropdownMenuItem<dynamic>> getDropDownMenuItems() {
    return widget.itemList
        .map<DropdownMenuItem<dynamic>>((item) => DropdownMenuItem<dynamic>(
            value: item.value, child: Text(item.label)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    // if (widget.value!=null widget.value.isNotEmpty) {
    //   _curValue = widget.value;
    // } else {
    //   _curValue = "";
    // }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // icon: Icon(Icons.folder),
      value: widget.value,
      iconSize: 24,
      elevation: 8,
      focusColor: Colors.transparent,

      icon: const Icon(
        Icons.abc,
        color: Colors.transparent,
        size: 5,
      ),
      autofocus: false,
      validator: (value) {
        if (value == null) {
          return 'Select ${widget.label}';
        }
        return null;
      },
      isExpanded: widget.isExpanded,
      decoration: InputDecoration(
        label: Text(
          widget.label ?? "",
          style: TextStyle(
            color: UpStyle.getForegroundColor(
              context,
              style: widget.style,
              colorType: widget.colorType,
            ),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: widget.suffixAction,
          icon: Icon(
            widget.suffixIcon ?? Icons.arrow_drop_down,
            color: UpStyle.getIconColor(
              context,
              style: widget.style,
              colorType: widget.colorType,
            ),
            size: UpStyle.getIconSize(
              context,
              style: widget.style,
              colorType: widget.colorType,
            ),
          ),
        ),

        prefixIcon: Visibility(
          visible: widget.prefixIcon != null,
          child: IconButton(
            onPressed: widget.prefixAction,
            icon: Icon(
              widget.prefixIcon,
              color: UpStyle.getIconColor(
                context,
                style: widget.style,
                colorType: widget.colorType,
              ),
              size: UpStyle.getIconSize(
                context,
                style: widget.style,
                colorType: widget.colorType,
              ),
            ),
          ),
        ),
        // icon: Visibility(
        //   visible: widget.icon != null,
        //   child: IconButton(
        //     onPressed: widget.iconAction,
        //     icon: Icon(
        //       widget.icon,
        //       color: UpStyle.getIconColor(
        //         context,
        //         style: widget.style,
        //         colorType: widget.colorType,
        //       ),
        //       size: UpStyle.getIconSize(
        //         context,
        //         style: widget.style,
        //         colorType: widget.colorType,
        //       ),
        //     ),
        //   ),
        // ),
        // // fillColor: Colors.orange,
        // focusColor: Colors.transparent,
        // hoverColor: Colors.pink,
        hintText: widget.hint,
        enabledBorder: UpStyle.getBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
        ),
        labelStyle: TextStyle(
          color: UpStyle.getForegroundColor(
            context,
            style: widget.style,
            colorType: widget.colorType,
          ),
        ),
        focusedBorder: UpStyle.getBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
          isFocused: true,
        ),
        errorBorder: UpStyle.getBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
          isError: true,
        ),
        border: UpStyle.getBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
        ),
      ),

      items: getDropDownMenuItems(),
      onChanged: changeValue,
    );
  }
}
