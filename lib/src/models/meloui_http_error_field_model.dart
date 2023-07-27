class MeloUIHttpErrorFieldModel {
  String key;
  List<String> errors;

  MeloUIHttpErrorFieldModel({required this.key, required this.errors});

  MeloUIHttpErrorFieldModel.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        errors = json['errors'];
}
