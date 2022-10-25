import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/widgets/up_loading_card.dart';

class UpLoadingDialog extends UpBaseDialog {
  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
      context: context,
      builder: (context) => UpLoadingCard(
        text: data['text'],
      ),
    );
  }
}
