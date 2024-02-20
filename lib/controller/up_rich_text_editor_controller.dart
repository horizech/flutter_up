import 'package:flutter/material.dart';

class UpRichTextEditorController extends ChangeNotifier {
  String deltaText;
  String plainText;
  String htmlText;

  UpRichTextEditorController({
    this.deltaText = "",
    this.htmlText = "",
    this.plainText = "",
  });

  void updateValue(String deltaText, String plainText, String htmlText) {
    this.deltaText = deltaText;
    this.plainText = plainText;
    this.htmlText = htmlText;
    notifyListeners();
  }
}
