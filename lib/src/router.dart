import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'db/isar.dart';
import 'modules/auth/view/auth.dart';
import 'modules/home/view/home.view.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userStreamPd);
    return appUser == null ? const AuthView() : const HomeView();
  }
}
