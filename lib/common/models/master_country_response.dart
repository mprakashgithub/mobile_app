class MasterCountryResponse {
  List<CountryItems>? items;
  int? updatedAt;

  MasterCountryResponse({this.items, this.updatedAt});

  MasterCountryResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CountryItems>[];
      json['items'].forEach((v) {
        items!.add(CountryItems.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CountryItems {
  String? type;
  String? countryId;
  String? countryCode;
  String? countryIsdCode;
  String? name;
  String? flagUnicode;
  List<ExchangeCurrencies>? currencies;
  List<ReceivingCountries>? receivingCountries;

  CountryItems(
      {this.type,
      this.countryId,
      this.countryCode,
      this.countryIsdCode,
      this.name,
      this.flagUnicode,
      this.currencies,
      this.receivingCountries});

  CountryItems.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    countryId = json['countryId'];
    countryCode = json['countryCode'];
    countryIsdCode = json['countryIsdCode'];
    name = json['name'];
    flagUnicode = json['flagUnicode'];
    if (json['currencies'] != null) {
      currencies = <ExchangeCurrencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(ExchangeCurrencies.fromJson(v));
      });
    }
    if (json['receivingCountries'] != null) {
      receivingCountries = <ReceivingCountries>[];
      json['receivingCountries'].forEach((v) {
        receivingCountries!.add(ReceivingCountries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['countryId'] = countryId;
    data['countryCode'] = countryCode;
    data['countryIsdCode'] = countryIsdCode;
    data['name'] = name;
    data['flagUnicode'] = flagUnicode;
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    if (receivingCountries != null) {
      data['receivingCountries'] =
          receivingCountries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExchangeCurrencies {
  String? currencyId;
  String? currencyCode;
  String? name;
  int? rounding;

  ExchangeCurrencies(
      {this.currencyId, this.currencyCode, this.name, this.rounding});

  ExchangeCurrencies.fromJson(Map<String, dynamic> json) {
    currencyId = json['currencyId'];
    currencyCode = json['currencyCode'];
    name = json['name'];
    rounding = json['rounding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currencyId'] = currencyId;
    data['currencyCode'] = currencyCode;
    data['name'] = name;
    data['rounding'] = rounding;
    return data;
  }
}

class ReceivingCountries {
  String? type;
  String? countryId;
  String? countryCode;
  String? countryIsdCode;
  String? name;
  String? flagUnicode;
  String? mobileRegEx;
  List<ExchangeCurrencies>? currencies;

  ReceivingCountries({
    this.type,
    this.countryId,
    this.countryIsdCode,
    this.countryCode,
    this.name,
    this.flagUnicode,
    this.currencies,
    this.mobileRegEx,
  });

  ReceivingCountries.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    countryId = json['countryId'];
    countryIsdCode = json['countryIsdCode'];
    countryCode = json['countryCode'];
    name = json['name'];
    flagUnicode = json['flagUnicode'];
    mobileRegEx = json['mobileRegEx'];
    if (json['currencies'] != null) {
      currencies = <ExchangeCurrencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(ExchangeCurrencies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['countryId'] = countryId;
    data['countryIsdCode'] = countryIsdCode;
    data['countryCode'] = countryCode;
    data['name'] = name;
    data['flagUnicode'] = flagUnicode;
    data['mobileRegEx'] = mobileRegEx;
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
