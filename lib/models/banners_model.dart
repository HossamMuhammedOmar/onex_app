class BannersModel {
  BannersModel({
    this.code,
    this.data,
  });

  String? code;
  List<Map<String, String>>? data;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        code: json["code"],
        data: List<Map<String, String>>.from(json["data"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
      );
}
