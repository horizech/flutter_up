import 'package:flutter/material.dart';

enum UpConsoleLevel { info, debug, error }

UpConsoleLevel currentUpupConsoleLevel = UpConsoleLevel.debug;

upConsole(UpConsoleLevel level, String text) {
  if (level.index >= currentUpupConsoleLevel.index) {
    debugPrint(text);
  }
}
