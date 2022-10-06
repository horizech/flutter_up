import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_up/flutter_up.dart';

void main() {
  test('adds one to input values', () {
    final flutter_up = FlutterUp();
    expect(flutter_up.info(), "FlutterUp");
  });
}
