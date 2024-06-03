import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/themes/themes.dart';

import '../../product/view/components/search.delegate.dart';
import '../../product/view/product.dart';
import '../../profile/view/profile.dart';
import '../provider/home.provider.dart';
import 'components/bottom.nav.bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: notifier.currentIndex == 0
              ? const ProductView()
              : notifier.currentIndex == 3
                  ? const ProfileView()
                  : const Center(child: Text('Will be implemented soon.')),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 56.0,
        width: 56.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: kGradient,
        ),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: () async =>
              await showSearch(context: context, delegate: SearchProducts()),
          child: const Icon(Icons.search, color: Colors.white, size: 30.0),
        ),
      ),
      bottomNavigationBar: KBottomNavBar(notifier),
    );
  }
}
