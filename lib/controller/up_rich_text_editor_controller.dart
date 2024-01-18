import 'package:flutter/material.dart';

class UpRichTextEditorController extends ChangeNotifier {
  String text;
  String plainText;

  UpRichTextEditorController({this.text = "", this.plainText = ""});

  void updateValue(String text, String plainText) {
    this.text = text;
    this.plainText = plainText;
    notifyListeners();
  }
}
