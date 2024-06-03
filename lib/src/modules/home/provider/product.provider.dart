import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product.dart';

typedef ProductNotifier = AsyncNotifierProvider<ProductProvider, List<Product>>;

final productProvider = ProductNotifier(ProductProvider.new);

class ProductProvider extends AsyncNotifier<List<Product>> {
  late List<Product> _products;
  @override
  FutureOr<List<Product>> build() async {
    _products = [];
    final res = await rootBundle.loadString('assets/json/response.json');
    final jsonList = jsonDecode(res) as List;
    for (final json in jsonList) {
      _products.add(Product.fromJson(json));
    }
    return _products;
  }

  List<Product> get products => _products;
}
