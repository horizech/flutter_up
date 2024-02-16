import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/helpers/up_datetime_helper.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_icon.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final UpInputType type;
  final UpValidation? validation;
  final Function? onChange;
  final UpStyle? style;
  final UpColorType? colorType;

  const UpTimePicker({
    super.key,
    this.type = UpInputType.outline,
    required this.controller,
    required this.label,
    this.validation,
    this.onChange,
    this.colorType,
    this.style,
  });

  @override
  State<UpTimePicker> createState() => _UpTimePickerState();
}

class _UpTimePickerState extends State<UpTimePicker> {
  @override
  Widget build(BuildContext context) {
    datePicker() async {
      TimeOfDay? pickedTime;
      if (context.mounted) {
        pickedTime = await UpDateTimeHelper.upTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
      }
      if (pickedTime != null) {
        widget.controller.text = "${pickedTime.hour}:${pickedTime.minute}";
        setState(() {});
        if (widget.onChange != null) {
          widget.onChange!(pickedTime);
        }
      }
    }

    return UpTextField(
        type: widget.type,
        controller: widget.controller,
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
