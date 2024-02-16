import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/helpers/up_datetime_helper.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_icon.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpDateTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final UpInputType type;
  final UpValidation? validation;
  final UpStyle? style;
  final UpColorType? colorType;
  final Function? onChange;

  const UpDateTimePicker({
    super.key,
    this.type = UpInputType.outline,
    required this.controller,
    required this.label,
    this.validation,
    this.style,
    this.colorType,
    this.onChange,
  });

  @override
  State<UpDateTimePicker> createState() => _UpDateTimePickerState();
}

class _UpDateTimePickerState extends State<UpDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    datePicker() async {
      DateTime? pickedDate = await UpDateTimeHelper.upDatePicker(
        context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      TimeOfDay? pickedTime;
      if (context.mounted) {
        pickedTime = await UpDateTimeHelper.upTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
      }

      if (pickedDate != null) {
        if (pickedTime != null) {
          pickedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        }

        widget.controller.text = pickedDate.toString();
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
