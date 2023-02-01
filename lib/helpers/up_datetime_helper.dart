import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpDateTimeHelper {
  static upDatePicker(BuildContext context,
      {DateTime? initialDate,
      required DateTime firstDate,
      required DateTime lastDate,
      UpStyle? style,
      UpColorType? colorType}) async {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: UpStyle.getDatePickerThemeData(context,
              style: style, colorType: colorType),
          child: child ?? const Text(""),
        );
      },
    );
  }

  static upTimePicker(
      {required BuildContext context,
      required TimeOfDay initialTime,
      UpStyle? style,
      UpColorType? colorType}) async {
    return showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: UpStyle.getTimePickerThemeData(context,
              style: style, colorType: colorType),
          child: child ?? const Text(""),
        );
      },
    );
  }

  static String _trimToRightPlaces(String str, int len) {
    String input = "00$str";
    if (input.length > len) {
      String result = input.substring(input.length - len, input.length);
      return result;
    }
    return input;
  }

  static String formatSecondsTime(int seconds) {
    if (seconds > 0) {
      int h = (seconds / 3600).floor();
      seconds = seconds - (h * 3600);
      int m = (seconds / 60).floor();
      int s = (seconds % 60).round();
      String hStr = _trimToRightPlaces("$h", 2);
      String mStr = _trimToRightPlaces("$m", 2);
      String sStr = _trimToRightPlaces("$s", 2);
      return "$hStr:$mStr:$sStr";
    } else {
      return "00:00";
    }
  }

  static String formatMinutesTime(int minutes) {
    if (minutes > 0) {
      int h = (minutes / 60).floor();
      int m = (minutes % 60).round();
      String hStr = _trimToRightPlaces("$h", 2);
      String mStr = _trimToRightPlaces("$m", 2);
      return "$hStr:$mStr";
    } else {
      return "00:00";
    }
  }
}
