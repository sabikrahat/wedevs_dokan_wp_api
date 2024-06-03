import 'package:flutter/material.dart';

import '../../config/custom.routes.dart';
import '../../utils/extensions/extensions.dart';
import '../settings/view/setting.view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0.0,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          surfaceTintColor: context.theme.scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
          title: Text('My Account', style: context.text.headlineSmall),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async =>
                  await fadePush(context, const SettingsView()),
              icon: Icon(
                Icons.settings_outlined,
                size: 30.0,
                color: context.theme.textTheme.labelLarge!.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
