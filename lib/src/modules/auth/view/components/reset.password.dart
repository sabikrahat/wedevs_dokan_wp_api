import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants.dart';
import '../../../../shared/animations_widget/animated_popup.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/transations/down.to.up.dart';
import '../../provider/auth.provider.dart';

class ForgetPasswordText extends ConsumerWidget {
  const ForgetPasswordText(this.notifier, {super.key});

  final AuthProvider notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DownToUpTransition(
      child: notifier.isSignup
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async => await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const ForgetPasswordPopup(),
                  ),
                  child: Text(
                    'Forget Password?',
                    style: context.theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.disabledColor,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class ForgetPasswordPopup extends StatefulWidget {
  const ForgetPasswordPopup({super.key});

  @override
  State<ForgetPasswordPopup> createState() => _ForgetPasswordPopupState();
}

class _ForgetPasswordPopupState extends State<ForgetPasswordPopup> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailCntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedPopup(
      child: AlertDialog(
        title: const Text('Forget Password'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: mainMin,
              children: [
                const Text(
                    'A reset password link will be sent to your email address.'),
                const SizedBox(height: 20.0),
                Material(
                  elevation: 5.0,
                  shadowColor: Colors.white,
                  shape: roundedRectangleBorder12,
                  child: TextFormField(
                    controller: emailCntrlr,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/svgs/email.svg',
                          colorFilter: Colors.grey[700]!.toColorFilter,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (_) async => submit(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Email is required';
                      }
                      if (!v.isEmail) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style:
                  TextStyle(color: context.theme.dividerColor.withOpacity(0.8)),
            ),
          ),
          TextButton(
            onPressed: () async => await submit(),
            child: Text('Send Email',
                style: TextStyle(color: context.theme.primaryColor)),
          ),
        ],
      ),
    );
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    EasyLoading.showToast('Will implement later!',
        toastPosition: EasyLoadingToastPosition.bottom);
  }
}
