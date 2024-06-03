part of 'product.dart';

extension ProductExt on Product {
  Product copyWith({
    int? id,
    String? name,
    double? price,
    double? regularPrice,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      image: image ?? this.image,
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
    };
  }

  String toRawJson() => json.encode(toJson());
}
