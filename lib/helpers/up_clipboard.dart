import 'package:flutter/services.dart';

upCopyTextToClipboard(String text) {
  upCopyToClipboard(ClipboardData(text: text));
}

upCopyToClipboard(ClipboardData data) {
  Clipboard.setData(data);
}
