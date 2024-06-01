import 'package:flutter/material.dart';

import '../../../../utils/transations/fade.switcher.dart';
import '../../provider/auth.provider.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(this.notifier, {super.key});

  final AuthProvider notifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              // style: context.theme.elevatedButtonTheme.style!.copyWith(
              //     minimumSize: WidgetStateProperty.all(const Size(180, 45))),
              child: FadeSwitcherTransition(
                child: notifier.isSignup
                    ? const Text('Sign Up')
                    : const Text('Login'),
              ),
              onPressed: () async => await notifier.submit(context),
            ),
          ),
        ],
      ),
    );
  }
}
