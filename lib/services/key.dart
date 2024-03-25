import 'dart:async';

import 'package:rxdart/subjects.dart';
// import 'package:rxdart/rxdart.dart';

class KeyService {
  final BehaviorSubject<bool> toggleFixedDrawer = BehaviorSubject.seeded(false);
  Stream get toggleFixedDrawerstream$ => toggleFixedDrawer.stream;
  bool get currentToggleFixedDrawer =>
      toggleFixedDrawer.valueWrapper?.value ?? false;

  void toggleFixedDrawerCallback() {
    // Get the current value
    final currentValue = toggleFixedDrawer.valueWrapper?.value ?? false;
    // Toggle the value
    toggleFixedDrawer.add(!currentValue);
  }
}
