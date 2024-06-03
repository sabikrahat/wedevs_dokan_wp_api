import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedevs_dokan_wp_api/src/modules/home/provider/home.provider.dart';

import '../../../config/constants.dart';
import '../../../config/custom.routes.dart';
import '../../../utils/themes/themes.dart';
import '../../profile/profile.dart';
import '../../settings/view/setting.view.dart';
import 'components/body.dart';
import 'components/bottom.nav.bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(homeProvider).when(
          loading: riverpodLoading,
          error: riverpodError,
          data: (data) {
            final notifier = ref.read(homeProvider.notifier);
            return Scaffold(
              body: SafeArea(
                child: notifier.currentIndex == 0
                    ? const MainBody()
                    : notifier.currentIndex == 3
                        ? const ProfileView()
                        : const Center(
                            child: Text('Will be implemented soon.')),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: roundedRectangleBorder60,
                onPressed: () async =>
                    await fadePush(context, const SettingsView()),
                child: const Icon(Icons.search, color: white, size: 30.0),
              ),
              bottomNavigationBar: KBottomNavBar(notifier),
            );
          },
        );
  }
}
