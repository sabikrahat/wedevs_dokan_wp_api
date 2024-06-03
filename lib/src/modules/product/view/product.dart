import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/constants.dart';
import '../../../utils/extensions/extensions.dart';
import '../provider/product.provider.dart';
import 'components/filter.dart';
import 'components/search.delegate.dart';
import 'components/tile.dart';

class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(productProvider).when(
          loading: riverpodLoading,
          error: riverpodError,
          data: (data) {
            final notifier = ref.read(productProvider.notifier);
            return Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                children: [
                  AppBar(
                    elevation: 0.0,
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    surfaceTintColor: context.theme.scaffoldBackgroundColor,
                    shadowColor: Colors.transparent,
                    title: Text('Product List',
                        style: context.text.headlineMedium),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () async => await showSearch(
                            context: context, delegate: SearchProducts()),
                        icon: Icon(
                          Icons.search,
                          size: 30.0,
                          color: context.theme.textTheme.labelLarge!.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () async => await showFilteringOptions(context),
                    borderRadius: borderRadius12,
                    child: Material(
                      elevation: 5.0,
                      shadowColor: Colors.white,
                      shape: roundedRectangleBorder12,
                      color: context.theme.cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/filter.svg',
                              width: 22,
                              height: 22,
                              colorFilter:
                                  context.theme.disabledColor.toColorFilter,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Filter',
                              style: context.text.titleLarge!.copyWith(
                                color: context.theme.disabledColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Sort by',
                              style: context.text.titleMedium!.copyWith(
                                color: context.theme.disabledColor,
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            SvgPicture.asset(
                              'assets/svgs/dropdown.svg',
                              width: 10,
                              height: 10,
                              colorFilter:
                                  context.theme.disabledColor.toColorFilter,
                            ),
                            const SizedBox(width: 20.0),
                            SvgPicture.asset(
                              'assets/svgs/menu.svg',
                              width: 18,
                              height: 18,
                              colorFilter:
                                  context.theme.disabledColor.toColorFilter,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Flexible(
                    child: notifier.products.isEmpty
                        ? const Center(child: KError('No data found.'))
                        : GridView.builder(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: notifier.products.length,
                            itemBuilder: (_, i) =>
                                ProductTile(notifier.products[i]),
                          ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
