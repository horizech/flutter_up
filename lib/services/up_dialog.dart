import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_up/dialogs/up_base.dart';

class UpDialogService {
  final Map<String, Completer> _dialogCompleter = {};

  String _createNewDialogCompleter() {
    //   if (_dialogCompleter == null) {
    //     _dialogCompleter = Map();
    //   }
    var uuid = const Uuid().v1();
    _dialogCompleter.putIfAbsent(uuid, () => Completer());
    return uuid;
  }

  Completer? getCompleter(String id) {
    return _dialogCompleter.containsKey(id) ? _dialogCompleter[id] : null;
  }

  Future? onDialogComplete(String id) {
    return _dialogCompleter.containsKey(id)
        ? _dialogCompleter[id]?.future
        : null;
  }

  /// Calls the dialog listener and returns Dialog Completer ID.
  String showDialog(BuildContext context, UpBaseDialog dialog, {dynamic data}) {
    String uuid = _createNewDialogCompleter();

    if (data != null) {
      dialog.show(context, uuid, data: data);
    } else {
      dialog.show(context, uuid);
    }

    return uuid; //getCompleter(uuid).future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void completeDialog(
      {required BuildContext context,
      required String completerId,
      dynamic result,
      pop = true}) {
    if (_dialogCompleter.containsKey(completerId)) {
      if (pop) {
        try {
          Navigator.of(context, rootNavigator: true).pop();
        } catch (_) {}
      }
      _dialogCompleter[completerId]?.complete(result);
      _dialogCompleter.remove(completerId);
    }
  }

  closeAllDialogs(BuildContext context) {
    if (_dialogCompleter.isNotEmpty) {
      for (var completerId in _dialogCompleter.keys) {
        try {
          Navigator.of(context, rootNavigator: true).pop();
          _dialogCompleter[completerId]?.complete();
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      _dialogCompleter.clear();
    }
  }
}
