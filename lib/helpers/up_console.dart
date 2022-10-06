import 'package:flutter/material.dart';

enum UpConsoleLevel { info, debug, error }

UpConsoleLevel currentUpConsoleLevel = UpConsoleLevel.debug;

console(UpConsoleLevel level, String text) {
  if (level.index >= currentUpConsoleLevel.index) {
    debugPrint(text);
  }
}
