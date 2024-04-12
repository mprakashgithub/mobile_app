class MasterCurrencyResponse {
  List<CurrencyItems>? items;
  int? updatedAt;

  MasterCurrencyResponse({this.items, this.updatedAt});

  MasterCurrencyResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CurrencyItems>[];
      json['items'].forEach((v) {
        items!.add(CurrencyItems.fromJson(v));
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

class CurrencyItems {
  String? key;
  String? name;
  String? symbol;
  String? asciSymbol;
  String? flagIcon;
  String? flagUnicode;

  CurrencyItems(
      {this.key,
      this.name,
      this.symbol,
      this.asciSymbol,
      this.flagIcon,
      this.flagUnicode});

  CurrencyItems.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    symbol = json['symbol'];
    asciSymbol = json['asciSymbol'];
    flagIcon = json['flagIcon'];
    flagUnicode = json['flagUnicode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['symbol'] = symbol;
    data['asciSymbol'] = asciSymbol;
    data['flagIcon'] = flagIcon;
    data['flagUnicode'] = flagUnicode;
    return data;
  }
}
