// To parse this JSON data, do
//
//     final detailDataResponse = detailDataResponseFromJson(jsonString);

import 'dart:convert';

DetailDataResponse detailDataResponseFromJson(String str) => DetailDataResponse.fromJson(json.decode(str));

String detailDataResponseToJson(DetailDataResponse data) => json.encode(data.toJson());

class DetailDataResponse {
  Data data;
  int code;

  DetailDataResponse({
    this.data,
    this.code,
  });

  factory DetailDataResponse.fromJson(Map<String, dynamic> json) => new DetailDataResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "code": code == null ? null : code,
  };
}

class Data {
  int id;
  String name;
  String description;
  Category category;
  Host host;
  String notes;
  String slug;
  String address;
  String detailAddress;
  double latitude;
  double longitude;
  List<MainImage> slides;
  MainImage mainImage;
  int basePrice;
  int price;
  List<ScheduleList> scheduleList;
  dynamic rating;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    this.id,
    this.name,
    this.description,
    this.category,
    this.host,
    this.notes,
    this.slug,
    this.address,
    this.detailAddress,
    this.latitude,
    this.longitude,
    this.slides,
    this.mainImage,
    this.basePrice,
    this.price,
    this.scheduleList,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    host: json["host"] == null ? null : Host.fromJson(json["host"]),
    notes: json["notes"] == null ? null : json["notes"],
    slug: json["slug"] == null ? null : json["slug"],
    address: json["address"] == null ? null : json["address"],
    detailAddress: json["detail_address"] == null ? null : json["detail_address"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    slides: json["slides"] == null ? null : new List<MainImage>.from(json["slides"].map((x) => MainImage.fromJson(x))),
    mainImage: json["main_image"] == null ? null : MainImage.fromJson(json["main_image"]),
    basePrice: json["base_price"] == null ? null : json["base_price"],
    price: json["price"] == null ? null : json["price"],
    scheduleList: json["schedule_list"] == null ? null : new List<ScheduleList>.from(json["schedule_list"].map((x) => ScheduleList.fromJson(x))),
    rating: json["rating"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "category": category == null ? null : category.toJson(),
    "host": host == null ? null : host.toJson(),
    "notes": notes == null ? null : notes,
    "slug": slug == null ? null : slug,
    "address": address == null ? null : address,
    "detail_address": detailAddress == null ? null : detailAddress,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "slides": slides == null ? null : new List<dynamic>.from(slides.map((x) => x.toJson())),
    "main_image": mainImage == null ? null : mainImage.toJson(),
    "base_price": basePrice == null ? null : basePrice,
    "price": price == null ? null : price,
    "schedule_list": scheduleList == null ? null : new List<dynamic>.from(scheduleList.map((x) => x.toJson())),
    "rating": rating,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class Category {
  int id;
  String name;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => new Category(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    slug: json["slug"] == null ? null : json["slug"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "slug": slug == null ? null : slug,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class Host {
  String name;
  String description;
  String slug;
  String address;
  String avatarUrl;
  DateTime createdAt;
  DateTime updatedAt;

  Host({
    this.name,
    this.description,
    this.slug,
    this.address,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Host.fromJson(Map<String, dynamic> json) => new Host(
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    slug: json["slug"] == null ? null : json["slug"],
    address: json["address"] == null ? null : json["address"],
    avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "slug": slug == null ? null : slug,
    "address": address == null ? null : address,
    "avatar_url": avatarUrl == null ? null : avatarUrl,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class MainImage {
  int id;
  bool mainImageDefault;
  String original;
  String large;
  String medium;
  String small;
  String thumbnail;

  MainImage({
    this.id,
    this.mainImageDefault,
    this.original,
    this.large,
    this.medium,
    this.small,
    this.thumbnail,
  });

  factory MainImage.fromJson(Map<String, dynamic> json) => new MainImage(
    id: json["id"] == null ? null : json["id"],
    mainImageDefault: json["default"] == null ? null : json["default"],
    original: json["original"] == null ? null : json["original"],
    large: json["large"] == null ? null : json["large"],
    medium: json["medium"] == null ? null : json["medium"],
    small: json["small"] == null ? null : json["small"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "default": mainImageDefault == null ? null : mainImageDefault,
    "original": original == null ? null : original,
    "large": large == null ? null : large,
    "medium": medium == null ? null : medium,
    "small": small == null ? null : small,
    "thumbnail": thumbnail == null ? null : thumbnail,
  };
}

class ScheduleList {
  int checkoutId;
  int activityId;
  String activityDate;
  String time;
  String duration;
  int minPax;
  int maxPax;
  List<Price> prices;
  int remainingSeat;

  ScheduleList({
    this.checkoutId,
    this.activityId,
    this.activityDate,
    this.time,
    this.duration,
    this.minPax,
    this.maxPax,
    this.prices,
    this.remainingSeat,
  });

  factory ScheduleList.fromJson(Map<String, dynamic> json) => new ScheduleList(
    checkoutId: json["checkout_id"] == null ? null : json["checkout_id"],
    activityId: json["activity_id"] == null ? null : json["activity_id"],
    activityDate: json["activity_date"] == null ? null : json["activity_date"],
    time: json["time"] == null ? null : json["time"],
    duration: json["duration"] == null ? null : json["duration"],
    minPax: json["min_pax"] == null ? null : json["min_pax"],
    maxPax: json["max_pax"] == null ? null : json["max_pax"],
    prices: json["prices"] == null ? null : new List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    remainingSeat: json["remaining_seat"] == null ? null : json["remaining_seat"],
  );

  Map<String, dynamic> toJson() => {
    "checkout_id": checkoutId == null ? null : checkoutId,
    "activity_id": activityId == null ? null : activityId,
    "activity_date": activityDate == null ? null : activityDate,
    "time": time == null ? null : time,
    "duration": duration == null ? null : duration,
    "min_pax": minPax == null ? null : minPax,
    "max_pax": maxPax == null ? null : maxPax,
    "prices": prices == null ? null : new List<dynamic>.from(prices.map((x) => x.toJson())),
    "remaining_seat": remainingSeat == null ? null : remainingSeat,
  };
}

class Price {
  int id;
  int activityConfigId;
  Effective effectiveDate;
  Effective effectiveUntil;
  int pax;
  int basePrice;
  int price;
  String promoType;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  Price({
    this.id,
    this.activityConfigId,
    this.effectiveDate,
    this.effectiveUntil,
    this.pax,
    this.basePrice,
    this.price,
    this.promoType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Price.fromJson(Map<String, dynamic> json) => new Price(
    id: json["id"] == null ? null : json["id"],
    activityConfigId: json["activity_config_id"] == null ? null : json["activity_config_id"],
    effectiveDate: json["effective_date"] == null ? null : Effective.fromJson(json["effective_date"]),
    effectiveUntil: json["effective_until"] == null ? null : Effective.fromJson(json["effective_until"]),
    pax: json["pax"] == null ? null : json["pax"],
    basePrice: json["base_price"] == null ? null : json["base_price"],
    price: json["price"] == null ? null : json["price"],
    promoType: json["promo_type"] == null ? null : json["promo_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "activity_config_id": activityConfigId == null ? null : activityConfigId,
    "effective_date": effectiveDate == null ? null : effectiveDate.toJson(),
    "effective_until": effectiveUntil == null ? null : effectiveUntil.toJson(),
    "pax": pax == null ? null : pax,
    "base_price": basePrice == null ? null : basePrice,
    "price": price == null ? null : price,
    "promo_type": promoType == null ? null : promoType,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
  };
}

class Effective {
  DateTime time;
  bool valid;

  Effective({
    this.time,
    this.valid,
  });

  factory Effective.fromJson(Map<String, dynamic> json) => new Effective(
    time: json["Time"] == null ? null : DateTime.parse(json["Time"]),
    valid: json["Valid"] == null ? null : json["Valid"],
  );

  Map<String, dynamic> toJson() => {
    "Time": time == null ? null : time.toIso8601String(),
    "Valid": valid == null ? null : valid,
  };
}
