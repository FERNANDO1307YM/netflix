import 'dart:convert';

class CreditResponse {
  CreditResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CreditResponse.fromJson(String str) => CreditResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreditResponse.fromMap(Map<String, dynamic> json) => CreditResponse(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
    "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
  };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.job,
  });

  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String job;

  get fullProfileImg {
    if(profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"] == null ? null : json["profile_path"],
    castId: json["cast_id"] == null ? null : json["cast_id"],
    character: json["character"] == null ? null : json["character"],
    creditId: json["credit_id"],
    order: json["order"] == null ? null : json["order"],
    job: json["job"] == null ? null : json["job"],
  );

  Map<String, dynamic> toMap() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath == null ? null : profilePath,
    "cast_id": castId == null ? null : castId,
    "character": character == null ? null : character,
    "credit_id": creditId,
    "order": order == null ? null : order,
    "job": job == null ? null : job,
  };
}
