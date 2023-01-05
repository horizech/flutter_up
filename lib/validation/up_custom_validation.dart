class UpCustomValidation {
  final String? rejex;
  final String? message;

  UpCustomValidation({this.rejex, this.message});

  static String? customValidation({
    UpCustomValidation? validation,
    required String value,
  }) {
    final regex = RegExp(validation?.rejex ?? "");

    return value.isNotEmpty && !regex.hasMatch(value)
        ? validation?.message ?? ""
        : null;
  }
}
