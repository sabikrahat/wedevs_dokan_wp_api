import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/transations/down.to.up.dart';
import '../../provider/auth.provider.dart';

class AuthAlternativeText extends StatelessWidget {
  const AuthAlternativeText(this.notifier, {super.key});

  final AuthProvider notifier;

  @override
  Widget build(BuildContext context) {
    return DownToUpTransition(
      child: notifier.isSignup
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    'Already have an account?',
                    style: context.text.titleLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  InkWell(
                    onTap: () => notifier.toggleIsSignup(),
                    borderRadius: borderRadius25,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'Login',
                        style: context.text.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () => notifier.toggleIsSignup(),
                borderRadius: borderRadius25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Create New Account',
                    style: context.text.titleLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
