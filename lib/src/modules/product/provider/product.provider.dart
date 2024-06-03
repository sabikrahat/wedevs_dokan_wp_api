import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enum/product.dart';

import '../model/product.dart';

typedef ProductNotifier = AsyncNotifierProvider<ProductProvider, List<Product>>;

final productProvider = ProductNotifier(ProductProvider.new);

class ProductProvider extends AsyncNotifier<List<Product>> {
  late List<Product> _products;
  ProductFilter _filter = ProductFilter.newest;
  ProductFilter? _tempFilter;

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

  List<Product> get rawProducts => _products;

  ProductFilter get filter => _filter;

  ProductFilter get tempFilter => _tempFilter ?? _filter;

  void changeFilter(ProductFilter? filter) {
    if (filter == null) return;
    _tempFilter = filter;
    ref.notifyListeners();
  }

  void applyFilter() {
    if (_tempFilter == null) return;
    _filter = _tempFilter!;
    _tempFilter = null;
    ref.notifyListeners();
  }

  List<Product> get products {
    switch (_filter) {
      case ProductFilter.newest:
        _products.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
        break;
      case ProductFilter.oldest:
        _products.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
      case ProductFilter.priceLowToHigh:
        _products.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case ProductFilter.priceHighToLow:
        _products.sort((a, b) => b.price!.compareTo(a.price!));
        break;
      case ProductFilter.bestSelling:
        _products.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
        break;
    }
    return _products;
  }
}
