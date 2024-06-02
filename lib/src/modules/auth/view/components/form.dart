import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/constants.dart';

import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/transations/down.to.up.dart';
import '../../provider/auth.provider.dart';
import 'reset.password.dart';

class AuthForm extends StatelessWidget {
  const AuthForm(this.notifier, {super.key});

  final AuthProvider notifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Form(
        key: notifier.isSignup ? notifier.signupFormKey : notifier.signinFormKey,
        child: Column(
          children: [
            DownToUpTransition(
              child: !notifier.isSignup
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Material(
                        elevation: 5.0,
                        shadowColor: Colors.white,
                        shape: roundedRectangleBorder12,
                        child: TextFormField(
                          controller: notifier.nameCntrlr,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name...',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                'assets/svgs/person.svg',
                                colorFilter: Colors.grey[700]!.toColorFilter,
                              ),
                            ),
                          ),
                          onFieldSubmitted: (_) async =>
                              notifier.submit(context),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          validator: (v) {
                            if (notifier.isSignup && v!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Material(
                elevation: 5.0,
                shadowColor: Colors.white,
                shape: roundedRectangleBorder12,
                child: TextFormField(
                  controller: notifier.emailCntrlr,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email...',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/svgs/email.svg',
                        colorFilter: Colors.grey[700]!.toColorFilter,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (_) async => notifier.submit(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Email is required';
                    }
                    if (notifier.isSignup && !v.isEmail) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: notifier.isSignup ? 25.0 : 15.0),
              child: Material(
                elevation: 5.0,
                shadowColor: Colors.white,
                shape: roundedRectangleBorder12,
                child: TextFormField(
                  controller: notifier.pwdCntrlr,
                  obscureText: notifier.pwdObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password...',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/svgs/password.svg',
                        colorFilter: Colors.grey[700]!.toColorFilter,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(notifier.pwdObscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: notifier.togglePwdObscure,
                    ),
                  ),
                  onFieldSubmitted: (_) async => notifier.submit(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: notifier.isSignup
                      ? TextInputAction.next
                      : TextInputAction.done,
                  keyboardType: TextInputType.text,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Password is required';
                    }
                    if (notifier.isSignup && !v.isPassword) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ForgetPasswordText(notifier),
            DownToUpTransition(
              child: !notifier.isSignup
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Material(
                        elevation: 5.0,
                        shadowColor: Colors.white,
                        shape: roundedRectangleBorder12,
                        child: TextFormField(
                          controller: notifier.pwdConfirmCntrlr,
                          obscureText: notifier.pwdConfirmObscure,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Enter your password again...',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                'assets/svgs/password.svg',
                                colorFilter: Colors.grey[700]!.toColorFilter,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(notifier.pwdConfirmObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: notifier.toggleConfirmPwdObscure,
                            ),
                          ),
                          onFieldSubmitted: (_) async =>
                              notifier.submit(context),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          validator: (v) {
                            if (notifier.isSignup &&
                                v != notifier.pwdCntrlr.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
