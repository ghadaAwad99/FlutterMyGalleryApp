import 'dart:convert';

GalleryModel galleryModelFromJson(String str) => GalleryModel.fromJson(json.decode(str));

class GalleryModel {
  GalleryModel({
    this.status,
    this.data,
    this.message,
  });

  String? status;
  Data? data;
  String? message;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
  );
}

class Data {
  Data({
    this.images,
  });

  List<dynamic>? images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
  );
}
