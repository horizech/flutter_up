import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/helpers/up_datetime_helper.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_icon.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final UpInputType type;
  final UpValidation? validation;
  final Function? onChange;
  final UpStyle? style;
  final UpColorType? colorType;

  const UpDatePicker({
    super.key,
    this.type = UpInputType.outline,
    required this.controller,
    required this.label,
    this.validation,
    this.onChange,
    this.style,
    this.colorType,
  });

  @override
  State<UpDatePicker> createState() => _UpDatePickerState();
}

class _UpDatePickerState extends State<UpDatePicker> {
  @override
  Widget build(BuildContext context) {
    datePicker() async {
      DateTime? pickedDate = await UpDateTimeHelper.upDatePicker(
        context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (pickedDate != null) {
        pickedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );
        widget.controller.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
        setState(() {});
        if (widget.onChange != null) {
          widget.onChange!(pickedDate);
        }
      }
    }

    return UpTextField(
        type: widget.type,
        controller: widget.controller,
        style: widget.style,
        colorType: widget.colorType,
        validation: widget.validation,
        prefixIcon: const UpIcon(
          icon: Icons.calendar_today,
        ),
        suffixIcon: Visibility(
          visible: widget.controller.text.isNotEmpty,
          child: UpIcon(
            icon: Icons.close,
            onTap: (() {
              setState(() {
                widget.controller.clear();
              });
              if (widget.onChange != null) {
                widget.onChange!("");
              }
            }),
          ),
        ),
        label: widget.label,
        readOnly: true,
        onTap: () {
          datePicker();
        });
  }
}
