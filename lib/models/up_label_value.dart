class UpLabelValuePair {
  String label;
  dynamic value;

  UpLabelValuePair({required this.label, required this.value});

  factory UpLabelValuePair.fromJson(Map<String, dynamic> json) {
    UpLabelValuePair labelValuePair =
        UpLabelValuePair(label: json['label'], value: json['value']);
    return labelValuePair;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}
