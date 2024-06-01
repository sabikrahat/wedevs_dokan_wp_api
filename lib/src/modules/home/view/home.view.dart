import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../../../config/custom.routes.dart';
import '../../../utils/themes/themes.dart';
import '../../settings/view/setting.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const name = '/home';
  static const label = appName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName)),
      body: const Center(child: Text('Hello World!')),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async => await fadePush(context, const SettingsView()),
        child: const Icon(Icons.settings, color: white, size: 20),
      ),
    );
  }
}
