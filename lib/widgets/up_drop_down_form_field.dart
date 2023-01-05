import 'package:flutter/material.dart';
import 'package:flutter_up/models/up_label_value.dart';

class UpDropDownFieldWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String value;
  final List<UpLabelValuePair> itemList;
  final TextStyle? textStyle;
  final Widget? underline;
  final Color? dropDownColor;
  final Widget? icon;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Widget? hint;
  final double? menuMaxHeight;
  final AlignmentGeometry alignmnet;
  final bool isDense;
  final double? itemHeight;
  final bool isExpanded;
  final Color? focusColor;
  final Function? ontap;
  final bool autoFocus;
  final BorderRadius? borderRadius;
  final Widget? disabledHint;

  const UpDropDownFieldWidget({
    Key? key,
    required this.value,
    required this.itemList,
    required this.onChanged,
    this.textStyle,
    this.underline,
    this.borderRadius,
    this.icon,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.dropDownColor,
    this.hint,
    this.disabledHint,
    this.autoFocus = false,
    this.alignmnet = AlignmentDirectional.centerStart,
    this.focusColor,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight,
    this.menuMaxHeight,
    this.ontap,
  }) : super(key: key);

  @override
  State<UpDropDownFieldWidget> createState() => UpDropDownFieldWidgetState();
}

class UpDropDownFieldWidgetState extends State<UpDropDownFieldWidget> {
  String? _curValue;

  changeValue(value) {
    widget.onChanged(value);
    setState(() {
      _curValue = value;
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
    if (widget.value.isNotEmpty) {
      _curValue = widget.value;
    } else {
      _curValue = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // icon: Icon(Icons.folder),
      value: _curValue,
      iconSize: 24,
      elevation: 8,
      dropdownColor:
          widget.dropDownColor ?? Theme.of(context).scaffoldBackgroundColor,
      icon: widget.icon,
      iconEnabledColor: widget.iconEnabledColor,
      iconDisabledColor: widget.iconDisabledColor,
      hint: widget.hint,
      menuMaxHeight: widget.menuMaxHeight,
      isExpanded: widget.isExpanded,
      itemHeight: widget.itemHeight,
      onTap: (() {
        widget.ontap;
      }),
      disabledHint: widget.disabledHint,
      borderRadius: widget.borderRadius,
      autofocus: widget.autoFocus,
      focusColor: widget.focusColor,
      isDense: widget.isDense,
      alignment: widget.alignmnet,
      style: widget.textStyle,
      // underline:
      //     widget.underline ?? Container(height: 2, color: Colors.deepPurple),
      items: getDropDownMenuItems(),
      onChanged: changeValue,
    );
  }
}
