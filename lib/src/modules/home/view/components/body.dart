import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_dokan_wp_api/src/modules/home/view/components/tile.dart';
import 'package:wedevs_dokan_wp_api/src/utils/extensions/extensions.dart';

import '../../../../config/constants.dart';
import '../../provider/product.provider.dart';

class MainBody extends ConsumerWidget {
  const MainBody({super.key});

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
                  title:
                      Text('Product List', style: context.text.headlineMedium),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30.0,
                        color: context.theme.textTheme.labelLarge!.color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Material(
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
                const SizedBox(height: 16.0),
                Flexible(
                  child: notifier.products.isEmpty
                      ? const Center(child: KError('No data found.'))
                      : GridView.builder(
                          padding: EdgeInsets.zero,
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
        });
  }
}


Future<void> showFilteringOptions(
  BuildContext context,
  HomeBanner? banner,
) async {
  return showModalBottomSheet(
    elevation: 2.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    context: context,
    builder: (_) => _BottomSheet(banner),
  );
}

class _BottomSheet extends ConsumerWidget {
  const _BottomSheet(this.banner);

  final HomeBanner? banner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productProvider(banner));
    final notifier = ref.read(productProvider(banner).notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: Column(
        mainAxisSize: mainMin,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBetween,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text('Sort by', style: context.text.titleLarge),
              const SizedBox(width: 35.0),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: mainMin,
                children: [
                  RadioListTile(
                    value: 1,
                    groupValue: 1,
                    activeColor: secondaryColor,
                    title: Text(
                      'Featured',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (_) {},
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: 1,
                    activeColor: secondaryColor,
                    title: Text(
                      'Best Selling',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (_) {},
                  ),
                  RadioListTile(
                    value: 1,
                    groupValue: notifier.sortBy,
                    activeColor: secondaryColor,
                    title: Text(
                      'Alphabetically, A-Z',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (_) {
                      notifier.sortBy = 1;
                      notifier.reload();
                    },
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: notifier.sortBy,
                    activeColor: secondaryColor,
                    title: Text(
                      'Alphabetically, Z-A',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (_) {
                      notifier.sortBy = 2;
                      notifier.reload();
                    },
                  ),
                  RadioListTile(
                    value: 3,
                    groupValue: notifier.sortBy,
                    activeColor: secondaryColor,
                    title: Text(
                      'Price, Low to High',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (_) {
                      notifier.sortBy = 3;
                      notifier.reload();
                    },
                  ),
                  RadioListTile(
                    value: 4,
                    groupValue: notifier.sortBy,
                    activeColor: secondaryColor,
                    title: Text(
                      'Price, High to Low',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (_) {
                      notifier.sortBy = 4;
                      notifier.reload();
                    },
                  ),
                  KButton(
                    'Apply',
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                    onTap: () async => await notifier
                        .dataLoad()
                        .then((value) => context.pop()),
                  ),
                  // KButton(
                  //   'Clear',
                  //   filled: false,
                  //   padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                  //   onTap: () => context.pop(),
                  // ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
