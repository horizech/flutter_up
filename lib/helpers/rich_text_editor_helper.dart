import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class UpRichTextEditorHelper {
  static QuillController convertStringToQuill(String text) {
    if (text.isNotEmpty) {
      if (text.contains("insert")) {
        return QuillController(
          document: Document.fromJson(jsonDecode(text)),
          selection: const TextSelection.collapsed(offset: 0),
        );
      } else {
        return QuillController(
            document: Document.fromJson([
              {'insert': '$text\n'}
            ]),
            selection: const TextSelection.collapsed(offset: 0));
      }
    } else {
      return QuillController(
          document: Document(),
          selection: const TextSelection.collapsed(offset: 0));
    }
  }

  static String convertQuillToString(QuillController controller) {
    return jsonEncode(controller.document.toDelta().toJson());
  }

  static String convertQuillToPlainString(QuillController controller) {
    return controller.document.toPlainText();
  }
}
