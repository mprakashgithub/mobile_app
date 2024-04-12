class CountryTimeZone {
  int? zW;
  int? gB;
  int? zA;
  int? lS;
  int? bI;

  CountryTimeZone({this.zW, this.gB, this.zA, this.lS, this.bI});

  CountryTimeZone.fromJson(Map<String, dynamic> json) {
    zW = json['ZW'];
    gB = json['GB'];
    zA = json['ZA'];
    lS = json['LS'];
    bI = json['BI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ZW'] = zW;
    data['GB'] = gB;
    data['ZA'] = zA;
    data['LS'] = lS;
    data['BI'] = bI;
    return data;
  }
}
