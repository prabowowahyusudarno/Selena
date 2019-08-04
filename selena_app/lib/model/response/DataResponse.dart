// To parse this JSON data, do
//
//     final dataResponse = dataResponseFromJson(jsonString);

import 'dart:convert';

DataResponse dataResponseFromJson(String str) => DataResponse.fromJson(json.decode(str));

String dataResponseToJson(DataResponse data) => json.encode(data.toJson());

class DataResponse {
  List<Datum> data;
  int total;
  int page;
  int size;
  int code;

  DataResponse({
    this.data,
    this.total,
    this.page,
    this.size,
    this.code,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) => new DataResponse(
    data: json["data"] == null ? null : new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    total: json["total"] == null ? null : json["total"],
    page: json["page"] == null ? null : json["page"],
    size: json["size"] == null ? null : json["size"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : new List<dynamic>.from(data.map((x) => x.toJson())),
    "total": total == null ? null : total,
    "page": page == null ? null : page,
    "size": size == null ? null : size,
    "code": code == null ? null : code,
  };
}

class Datum {
  int id;
  String name;
  String description;
  int price;
  MainImage mainImage;
  String newDate;
  String slug;

  Datum({
    this.id,
    this.name,
    this.description,
    this.price,
    this.mainImage,
    this.newDate,
    this.slug,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    mainImage: json["main_image"] == null ? null : MainImage.fromJson(json["main_image"]),
    newDate: json["date"] == null ? null : json["date"],
    slug: json["slug"] == null ? null : json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "main_image": mainImage == null ? null : mainImage.toJson(),
    "newDate": newDate == null ? null : newDate,
    "slug": slug == null ? null : slug,
  };
}

class MainImage {
  String url;
  bool mainImageDefault;

  MainImage({
    this.url,
    this.mainImageDefault,
  });

  factory MainImage.fromJson(Map<String, dynamic> json) => new MainImage(
    url: json["url"] == null ? null : json["url"],
    mainImageDefault: json["default"] == null ? null : json["default"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "default": mainImageDefault == null ? null : mainImageDefault,
  };
}
