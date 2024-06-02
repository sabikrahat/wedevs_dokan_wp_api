import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_dokan_wp_api/src/utils/extensions/extensions.dart';

import '../../../config/constants.dart';
import '../../../config/custom.routes.dart';
import '../../../utils/themes/themes.dart';
import '../../settings/view/setting.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName)),
      body: const Center(child: Text('Hello World!')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: roundedRectangleBorder60,
        onPressed: () async => await fadePush(context, const SettingsView()),
        child: const Icon(Icons.search, color: white, size: 30.0),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomAppBar(
          color: context.theme.cardColor,
          elevation: 50.0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svgs/home.svg',
                  width: 35,
                  height: 35,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svgs/category.svg',
                  width: 35,
                  height: 35,
                ),
              ),
              const SizedBox(width: 35),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svgs/cart.svg',
                  width: 35,
                  height: 35,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svgs/person.svg',
                  width: 35,
                  height: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
