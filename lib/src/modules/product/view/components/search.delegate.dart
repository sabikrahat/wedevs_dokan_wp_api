import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../model/product.dart';
import '../../provider/product.provider.dart';

import '../../../../config/constants.dart';
import '../../../../shared/k_list_tile.dart/k_list_tile.dart';
import '../../../../utils/extensions/extensions.dart';

class SearchProducts extends SearchDelegate {
  SearchProducts({String hintText = 'Search product'})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: context.theme.primaryColor),
        tooltip: 'Clear',
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: context.theme.primaryColor,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) => ref.watch(productProvider).when(
            loading: riverpodLoading,
            error: riverpodError,
            data: (data) {
              final products =
                  data.where((e) => e.name?.contains(query) ?? false).toList();
              return query.isEmpty
                  ? displayNoQuerySearchScreen()
                  : products.isEmpty
                      ? displayNoUsersFoundScreen()
                      : ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (_, index) => _Tile(products[index]),
                        );
            },
          ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) => ref.watch(productProvider).when(
            loading: riverpodLoading,
            error: riverpodError,
            data: (data) {
              final products =
                  data.where((e) => e.name?.contains(query) ?? false).toList();
              return query.isEmpty
                  ? displayNoQuerySearchScreen()
                  : products.isEmpty
                      ? displayNoUsersFoundScreen()
                      : ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (_, index) => _Tile(products[index]),
                        );
            },
          ),
    );
  }

  Widget displayNoQuerySearchScreen() {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: const [
          Icon(Icons.shopping_cart_checkout, color: Colors.grey, size: 70.0),
          Text(
            'Search Product by name',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget displayNoUsersFoundScreen() {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: const [
          Icon(Icons.production_quantity_limits,
              color: Colors.grey, size: 70.0),
          Text(
            'No product found',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        shadowColor: context.theme.cardColor,
        shape: roundedRectangleBorder12,
        child: KListTile(
          title:
              Text(product.name ?? 'No name', style: context.text.titleMedium),
          subtitle: Row(
            children: [
              if (product.regularPrice != null &&
                  (product.price ?? 0.0) < (product.regularPrice ?? 0.0))
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    product.regularPrice?.formattedFloat ?? '--',
                    style: context.text.titleMedium!.copyWith(
                        color: context.theme.disabledColor,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              Text(
                product.price?.formattedFloat ?? '--',
                style: context.theme.textTheme.titleMedium!
                    .copyWith(color: context.theme.primaryColor),
              ),
            ],
          ),
          leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: borderRadius60,
              color: context.theme.primaryColor.withOpacity(0.1),
              border: Border.all(
                color: context.theme.primaryColor.withOpacity(0.3),
                width: 1.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: borderRadius60,
              child: FastCachedImage(
                key: ValueKey(product.image),
                url: product.image ?? '',
                width: 60.0,
                height: 60.0,
                loadingBuilder: (_, p) => SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SpinKitThreeBounce(
                      color: context.theme.primaryColor,
                      size: 20.0,
                    ),
                  ),
                ),
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () => EasyLoading.showToast('Will be implemented soon'),
        ),
      ),
    );
  }
}
