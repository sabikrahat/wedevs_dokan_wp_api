import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedevs_dokan_wp_api/src/utils/extensions/extensions.dart';

import '../../../../config/constants.dart';
import '../../../../utils/themes/themes.dart';
import '../../provider/product.provider.dart';

Future<void> showFilteringOptions(
  BuildContext context,
  ProductProvider notifier,
) async {
  return showModalBottomSheet(
    elevation: 2.0,
    context: context,
    shape: roundedRectangleBorder0,
    builder: (_) => _BottomSheet(notifier),
  );
}

class _BottomSheet extends ConsumerWidget {
  const _BottomSheet(this.notifier);

  final ProductProvider notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: Column(
        mainAxisSize: mainMin,
        children: [
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              Container(
                height: 5.0,
                width: 100.0,
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: borderRadius45,
                  gradient: kGradient,
                ),
              ),
            ],
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: mainMin,
                children: [
                  RadioListTile(
                    value: 1,
                    groupValue: 1,
                    activeColor: context.theme.primaryColor,
                    title: Text(
                      'Newest',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (_) {},
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: 1,
                    activeColor: context.theme.primaryColor,
                    title: Text(
                      'Oldest',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (_) {},
                  ),
                  RadioListTile(
                    value: 3,
                    groupValue: 1,
                    activeColor: context.theme.primaryColor,
                    title: Text(
                      'Price, Low to High',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (_) {
                      // notifier.sortBy = 3;
                      // notifier.reload();
                    },
                  ),
                  RadioListTile(
                    value: 4,
                    groupValue: 1,
                    activeColor: context.theme.primaryColor,
                    title: Text(
                      'Price, High to Low',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (_) {
                      // notifier.sortBy = 4;
                      // notifier.reload();
                    },
                  ),
                  RadioListTile(
                    value: 5,
                    groupValue: 1,
                    activeColor: context.theme.primaryColor,
                    title: Text(
                      'Best Selling',
                      style: context.text.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (_) {
                      // notifier.sortBy = 4;
                      // notifier.reload();
                    },
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: [
                      const SizedBox(width: 25.0),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: context.theme.disabledColor,
                            side:
                                BorderSide(color: context.theme.disabledColor),
                          ),
                          onPressed: context.pop,
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1ABC9C),
                          ),
                          onPressed: () {},
                          child: const Text('Apply'),
                        ),
                      ),
                      const SizedBox(width: 25.0),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
