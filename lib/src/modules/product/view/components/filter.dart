import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/themes/themes.dart';
import '../../enum/product.dart';
import '../../provider/product.provider.dart';

Future<void> showFilteringOptions(BuildContext context) async {
  return showModalBottomSheet(
    elevation: 2.0,
    context: context,
    shape: roundedRectangleBorder0,
    builder: (_) => const _BottomSheet(),
  );
}

class _BottomSheet extends ConsumerWidget {
  const _BottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productProvider);
    final notifier = ref.read(productProvider.notifier);
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
                  ...ProductFilter.values.map(
                    (e) => RadioListTile(
                      value: e,
                      groupValue: notifier.tempFilter,
                      activeColor: context.theme.primaryColor,
                      title: Text(
                        e.label,
                        style:
                            context.text.titleMedium!.copyWith(fontSize: 18.0),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: notifier.changeFilter,
                    ),
                  ),
                  Container(
                    height: 70.0,
                    alignment: Alignment.center,
                    child: notifier.filter != notifier.tempFilter
                        ? Text(
                            'You have changed the filter. Do you want to apply it?',
                            style: context.text.titleMedium!.copyWith(
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : const SizedBox.shrink(),
                  ),
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
                          onPressed: () {
                            notifier.applyFilter();
                            context.pop();
                          },
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
