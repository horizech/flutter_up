import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class UpRichTextEditorHelper {
  static QuillController convertTextToQuill(String text) {
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

  static String convertQuillToText(QuillController controller) {
    return jsonEncode(controller.document.toDelta().toJson());
  }

  static String convertQuillToPlainText(QuillController controller) {
    return controller.document.toPlainText();
  }

  static String convertDeltaToHtml(dynamic deltaJson) {
    QuillController controller = QuillController(
      document: Document.fromJson(deltaJson),
      selection: const TextSelection.collapsed(offset: 0),
    );
    return convertQuillToHtmlText(controller);
  }

  static String convertQuillToHtmlText(QuillController controller) {
    final deltaJson = controller.document.toDelta().toJson();
    final converter = QuillDeltaToHtmlConverter(
      List.castFrom(
        deltaJson,
      ),
      ConverterOptions.forEmail(),
    );

    final html = converter.convert();
    return html;
  }

  static String convertDeltaTextToPlainText(String text) {
    QuillController controller =
        UpRichTextEditorHelper.convertTextToQuill(text);
    return controller.document.toPlainText();
  }
}
