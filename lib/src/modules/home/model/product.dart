import 'dart:convert';

import 'package:wedevs_dokan_wp_api/src/utils/extensions/extensions.dart';

part 'product.ext.dart';

class Product {
  int? id;
  String? name;
  double? price;
  double? regularPrice;
  String? image;
  int? ratingCount;
  DateTime? dateCreated;

  Product({
    this.id,
    this.name,
    this.price,
    this.regularPrice,
    this.image,
    this.ratingCount,
    this.dateCreated,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json[_Json.id]?.toString().toInt,
      name: json[_Json.name],
      price: json[_Json.price]?.toString().toDouble,
      regularPrice: json[_Json.regularPrice]?.toString().toDouble,
      image:
          json[_Json.images] == null ? null : json[_Json.images][0][_Json.src],
      ratingCount: json[_Json.ratingCount]?.toString().toInt,
      dateCreated: json[_Json.dateCreated] == null
          ? null
          : DateTime.parse(json[_Json.dateCreated] as String).toLocal(),
    );
  }

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  @override
  String toString() =>
      'Product(id: $id, name: $name, price: $price, regularPrice: $regularPrice, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class _Json {
  static const String id = 'id';
  static const String name = 'name';
  static const String price = 'price';
  static const String regularPrice = 'regular_price';
  static const String images = 'images';
  static const String src = 'src';
  static const String ratingCount = 'rating_count';
  static const String dateCreated = 'date_created';

}
