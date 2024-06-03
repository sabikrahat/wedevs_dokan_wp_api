enum ProductFilter {
  newest,
  oldest,
  priceLowToHigh,
  priceHighToLow,
  bestSelling,
}

extension ProductFilterExt on ProductFilter {
  String get label {
    switch (this) {
      case ProductFilter.newest:
        return 'Newest';
      case ProductFilter.oldest:
        return 'Oldest';
      case ProductFilter.priceLowToHigh:
        return 'Price: Low to High';
      case ProductFilter.priceHighToLow:
        return 'Price: High to Low';
      case ProductFilter.bestSelling:
        return 'Best Selling';
    }
  }

  int get value {
    switch (this) {
      case ProductFilter.newest:
        return 1;
      case ProductFilter.oldest:
        return 2;
      case ProductFilter.priceLowToHigh:
        return 3;
      case ProductFilter.priceHighToLow:
        return 4;
      case ProductFilter.bestSelling:
        return 5;
    }
  }

  bool get isNewest => this == ProductFilter.newest;

  bool get isOldest => this == ProductFilter.oldest;

  bool get isPriceLowToHigh => this == ProductFilter.priceLowToHigh;

  bool get isPriceHighToLow => this == ProductFilter.priceHighToLow;

  bool get isBestSelling => this == ProductFilter.bestSelling;

  bool get isNotNewest => !isNewest;

  bool get isNotOldest => !isOldest;

  bool get isNotPriceLowToHigh => !isPriceLowToHigh;

  bool get isNotPriceHighToLow => !isPriceHighToLow;

  bool get isNotBestSelling => !isBestSelling;

}
