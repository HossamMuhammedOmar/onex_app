class BannersModel {
  BannersModel({
    this.code,
    this.data,
  });

  String? code;
  List<Map<String, dynamic>>? data;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        code: json["code"],
        data: List<Map<String, dynamic>>.from(json["data"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      );
}
