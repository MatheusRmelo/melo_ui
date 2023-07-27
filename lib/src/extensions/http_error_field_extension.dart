import 'package:melo_ui/src/models/meloui_http_error_field_model.dart';

extension HttpErrorFieldExtension on List<MeloUIHttpErrorFieldModel> {
  String getFirstErrorByKey(String key) {
    MeloUIHttpErrorFieldModel? error =
        where((element) => element.key == key).firstOrNull;
    if (error == null) return "";
    return error.errors.firstOrNull ?? "Não foi possível encontrar o erro";
  }

  MeloUIHttpErrorFieldModel? getErrorByKey(String key) {
    MeloUIHttpErrorFieldModel? error =
        where((element) => element.key == key).firstOrNull;
    return error;
  }
}
