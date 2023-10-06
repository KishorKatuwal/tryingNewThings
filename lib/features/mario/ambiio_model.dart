import 'dart:convert';

AmiioModel amiioModelFromJson(String str) =>
    AmiioModel.fromJson(json.decode(str));

String amiioModelToJson(AmiioModel data) => json.encode(data.toJson());

class AmiioModel {
  final List<Amiibo> amiibo;

  AmiioModel({
    required this.amiibo,
  });

  factory AmiioModel.fromJson(Map<String, dynamic> json) => AmiioModel(
        amiibo:
            List<Amiibo>.from(json["amiibo"].map((x) => Amiibo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "amiibo": List<dynamic>.from(amiibo.map((x) => x.toJson())),
      };
}

class Amiibo {
  final String amiiboSeries;
  final Character character;
  final GameSeries gameSeries;
  final String head;
  final String image;
  final String name;
  final Release release;
  final String tail;
  final Type type;

  Amiibo({
    required this.amiiboSeries,
    required this.character,
    required this.gameSeries,
    required this.head,
    required this.image,
    required this.name,
    required this.release,
    required this.tail,
    required this.type,
  });

  factory Amiibo.fromJson(Map<String, dynamic> json) => Amiibo(
        amiiboSeries: json["amiiboSeries"],
        character: characterValues.map[json["character"]]!,
        gameSeries: gameSeriesValues.map[json["gameSeries"]]!,
        head: json["head"],
        image: json["image"],
        name: json["name"],
        release: Release.fromJson(json["release"]),
        tail: json["tail"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "amiiboSeries": amiiboSeries,
        "character": characterValues.reverse[character],
        "gameSeries": gameSeriesValues.reverse[gameSeries],
        "head": head,
        "image": image,
        "name": name,
        "release": release.toJson(),
        "tail": tail,
        "type": typeValues.reverse[type],
      };
}

enum Character { BABY_MARIO, MARIO, MARIO_CEREAL, METAL_MARIO }

final characterValues = EnumValues({
  "Baby Mario": Character.BABY_MARIO,
  "Mario": Character.MARIO,
  "Mario Cereal": Character.MARIO_CEREAL,
  "Metal Mario": Character.METAL_MARIO
});

enum GameSeries { KELLOGS, MARIO_SPORTS_SUPERSTARS, SUPER_MARIO }

final gameSeriesValues = EnumValues({
  "Kellogs": GameSeries.KELLOGS,
  "Mario Sports Superstars": GameSeries.MARIO_SPORTS_SUPERSTARS,
  "Super Mario": GameSeries.SUPER_MARIO
});

class Release {
  final DateTime au;
  final DateTime eu;
  final DateTime jp;
  final DateTime na;

  Release({
    required this.au,
    required this.eu,
    required this.jp,
    required this.na,
  });

  factory Release.fromJson(Map<String, dynamic> json) => Release(
        au: DateTime.parse(json["au"] ?? "2015-03-21"),
        eu: DateTime.parse(json["eu"]?? "2015-03-21"),
        jp: DateTime.parse(json["jp"]?? "2015-03-21"),
        na: DateTime.parse(json["na"]?? "2015-03-21"),
      );

  Map<String, dynamic> toJson() => {
        "au":
            "${au.year.toString().padLeft(4, '0')}-${au.month.toString().padLeft(2, '0')}-${au.day.toString().padLeft(2, '0')}",
        "eu":
            "${eu.year.toString().padLeft(4, '0')}-${eu.month.toString().padLeft(2, '0')}-${eu.day.toString().padLeft(2, '0')}",
        "jp":
            "${jp.year.toString().padLeft(4, '0')}-${jp.month.toString().padLeft(2, '0')}-${jp.day.toString().padLeft(2, '0')}",
        "na":
            "${na.year.toString().padLeft(4, '0')}-${na.month.toString().padLeft(2, '0')}-${na.day.toString().padLeft(2, '0')}",
      };
}

enum Type { BAND, CARD, FIGURE }

final typeValues =
    EnumValues({"Band": Type.BAND, "Card": Type.CARD, "Figure": Type.FIGURE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
