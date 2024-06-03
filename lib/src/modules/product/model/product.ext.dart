part of 'product.dart';

extension ProductExt on Product {
  Product copyWith({
    int? id,
    String? name,
    double? price,
    double? regularPrice,
    String? image,
    int? ratingCount,
    int? totalSales,
    DateTime? dateCreated,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      image: image ?? this.image,
      ratingCount: ratingCount ?? this.ratingCount,
      totalSales: totalSales ?? this.totalSales,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _Json.id: id,
      _Json.name: name,
      _Json.price: price,
      _Json.regularPrice: regularPrice,
      _Json.images: [
        {
          _Json.src: image,
        }
      ],
      _Json.ratingCount: ratingCount,
      _Json.totalSales: totalSales,
      _Json.dateCreated: dateCreated?.toIso8601String(),
    };
  }

  String toRawJson() => json.encode(toJson());
}
