import 'dart:convert';

class UiCallingCode {
  final String? id;
  final String? code;
  final String? name;
  final List<int>? lenLimits;

  UiCallingCode({
    this.id,
    this.code,
    this.name,
    this.lenLimits,
  });

  UiCallingCode copyWith({
    String? id,
    String? code,
    String? name,
    List<int>? lenLimits,
  }) =>
      UiCallingCode(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        lenLimits: lenLimits ?? this.lenLimits,
      );

  factory UiCallingCode.fromRawJson(String str) =>
      UiCallingCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UiCallingCode.fromJson(Map<String, dynamic> json) => UiCallingCode(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        lenLimits: json["lenLimits"] == null
            ? []
            : List<int>.from(json["lenLimits"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "lenLimits": lenLimits == null
            ? []
            : List<dynamic>.from(lenLimits!.map((x) => x)),
      };
}
