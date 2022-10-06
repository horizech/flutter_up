import 'package:flutter/services.dart';

copyTextToClipboard(String text) {
  copyToClipboard(ClipboardData(text: text));
}

copyToClipboard(ClipboardData data) {
  Clipboard.setData(data);
}
