import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/constants.dart';
import '../../../utils/themes/themes.dart';
import '../../product/view/components/search.delegate.dart';
import '../../product/view/product.dart';
import '../../profile/profile.dart';
import '../provider/home.provider.dart';
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: notifier.currentIndex == 0
                      ? const ProductView()
                      : notifier.currentIndex == 3
                          ? const ProfileView()
                          : const Center(
                              child: Text('Will be implemented soon.')),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: roundedRectangleBorder60,
                onPressed: () async => await showSearch(
                    context: context, delegate: SearchProducts()),
                child: const Icon(Icons.search, color: white, size: 30.0),
              ),
              bottomNavigationBar: KBottomNavBar(notifier),
            );
          },
        );
  }
}
