import 'package:flutter_up/validation/up_custom_validation.dart';

class UpValidation {
  final int? minLength;
  final List<int>? fixedLengths;
  final bool? isEmail;
  final bool? isRequired;
  final UpCustomValidation? customValidation;

  UpValidation({
    this.minLength,
    this.isEmail = false,
    this.isRequired = false,
    this.fixedLengths,
    this.customValidation,
  });
}
