import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/constants.dart';
import '../provider/auth.provider.dart';
import 'components/alternative.text.dart';
import 'components/button.dart';
import 'components/form.dart';
import 'components/image.select.dart';
import 'components/social.auth.dart';

class AuthView extends ConsumerWidget {
  const AuthView({this.isSignup = false, super.key});

  final bool isSignup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider(isSignup));
    final notifier = ref.read(authProvider(isSignup).notifier);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              duration: const Duration(milliseconds: 200),
              child: Column(
                mainAxisSize: mainMin,
                children: [
                  AuthImageSelect(notifier),
                  AuthForm(notifier),
                  AuthButton(notifier),
                  SocialAuth(notifier),
                  AuthAlternativeText(notifier),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
