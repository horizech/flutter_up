import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/helpers/up_datetime_helper.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_icon.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final UpInputType type;
  final UpValidation? validation;

  const UpTimePicker({
    super.key,
    this.type = UpInputType.outline,
    required this.controller,
    required this.label,
    this.validation,
  });

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
        controller.text = "${pickedTime.hour}:${pickedTime.minute}";
      }
    }

    return UpTextField(
        type: type,
        controller: controller,
        validation: validation,
        prefixIcon: const UpIcon(
          icon: Icons.calendar_today,
        ),
        label: label,
        readOnly: true,
        onTap: () {
          datePicker();
        });
  }
}
