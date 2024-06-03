import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../provider/home.provider.dart';

class KBottomNavBar extends StatelessWidget {
  const KBottomNavBar(this.notifier, {super.key});

  final HomeProvider notifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    context.theme.textTheme.bodyMedium!.color!.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: BottomAppBar(
              color: context.theme.cardColor,
              elevation: 10.0,
              shape: const CircularNotchedRectangle(),
              notchMargin: 5.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: mainSpaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => notifier.changeIndex(0),
                      icon: SvgPicture.asset(
                        'assets/svgs/home.svg',
                        width: 35,
                        height: 35,
                        colorFilter: notifier.currentIndex == 0
                            ? context.theme.primaryColor.toColorFilter
                            : context.theme.textTheme.bodyMedium!.color!
                                .toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () => notifier.changeIndex(1),
                      icon: SvgPicture.asset(
                        'assets/svgs/category.svg',
                        width: 35,
                        height: 35,
                        colorFilter: notifier.currentIndex == 1
                            ? context.theme.primaryColor.toColorFilter
                            : context.theme.textTheme.bodyMedium!.color!
                                .toColorFilter,
                      ),
                    ),
                    const SizedBox(width: 35),
                    IconButton(
                      onPressed: () => notifier.changeIndex(2),
                      icon: SvgPicture.asset(
                        'assets/svgs/cart.svg',
                        width: 35,
                        height: 35,
                        colorFilter: notifier.currentIndex == 2
                            ? context.theme.primaryColor.toColorFilter
                            : context.theme.textTheme.bodyMedium!.color!
                                .toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () => notifier.changeIndex(3),
                      icon: SvgPicture.asset(
                        'assets/svgs/person.svg',
                        width: 35,
                        height: 35,
                        colorFilter: notifier.currentIndex == 3
                            ? context.theme.primaryColor.toColorFilter
                            : context.theme.textTheme.bodyMedium!.color!
                                .toColorFilter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
