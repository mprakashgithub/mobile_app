class LanguageModel {
  String languageName;
  String languageCode;
  String countryCode;
  String jsonData;

  LanguageModel(
      {required this.languageName,
      required this.countryCode,
      required this.languageCode,
      required this.jsonData});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['languageName'] = languageName;
    json['countryCode'] = countryCode;
    json['languageCode'] = languageCode;
    json['jsonData'] = jsonData;
    return json;
  }
}
