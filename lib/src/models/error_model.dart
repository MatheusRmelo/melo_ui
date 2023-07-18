class ErrorModel {
  String key;
  String value;

  ErrorModel({required this.key, required this.value});

  ErrorModel.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        value = json['value'];
}
