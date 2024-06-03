import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wedevs_dokan_wp_api/src/utils/extensions/extensions.dart';

import '../../../../config/constants.dart';
import '../../model/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shadowColor: Colors.white,
      shape: roundedRectangleBorder12,
      color: context.theme.cardColor,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Expanded(
            flex: 9,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: FastCachedImage(
                url: product.image ?? '',
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
          Expanded(
            flex: 4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    product.name ?? 'No Name',
                    style: context.theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      if (product.regularPrice != null &&
                          (product.price ?? 0.0) <
                              (product.regularPrice ?? 0.0))
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
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemSize: 17,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (_, __) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) =>
                        debugPrint('Rating updated: $rating'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
