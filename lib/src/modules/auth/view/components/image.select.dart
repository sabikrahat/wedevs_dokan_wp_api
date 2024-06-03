import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/constants.dart';
import '../../../../shared/gradient_widget/gradient_widget.dart';
import '../../../../shared/image.widget/image.widget.dart';
import '../../../../shared/image_process/single/pick.photo.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/transations/down.to.up.dart';
import '../../../../utils/transations/fade.switcher.dart';
import '../../provider/auth.provider.dart';

class AuthImageSelect extends StatelessWidget {
  const AuthImageSelect(this.notifier, {super.key});

  final AuthProvider notifier;

  @override
  Widget build(BuildContext context) {
    return DownToUpTransition(
      child: notifier.isSignup
          ? Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 20),
              child: InkWell(
                borderRadius: borderRadius100,
                onTap: () async => await pickPhoto(context).then((pk) {
                  if (pk == null) return;
                  notifier.setImage(pk);
                }),
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: borderRadius100,
                        boxShadow: [
                          BoxShadow(
                            color: context.theme.textTheme.bodyMedium!.color!
                                .withOpacity(0.15),
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: context.theme.textTheme.bodyMedium!.color!
                                .withOpacity(0.15),
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: FadeSwitcherTransition(
                        child: notifier.image == null
                            ? SvgPicture.asset(
                                'assets/svgs/person.svg',
                                width: 35,
                              )
                            : ClipRRect(
                                borderRadius: borderRadius100,
                                child: ImageWidget(
                                  notifier.image!,
                                ),
                              ),
                      ),
                    ),
                    if (notifier.image != null)
                      Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () => notifier.removeImage(),
                          child: GradientWidget(
                            height: 25,
                            width: 25,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.close,
                                color: context.theme.scaffoldBackgroundColor,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (notifier.image == null)
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: InkWell(
                          borderRadius: borderRadius100,
                          onTap: () async =>
                              await pickPhoto(context).then((pk) {
                            if (pk == null) return;
                            notifier.setImage(pk);
                          }),
                          child: GradientWidget(
                            height: 30,
                            width: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.camera_alt_sharp,
                                color: context.theme.scaffoldBackgroundColor,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    width: context.width * 0.5,
                  ),
                  const SizedBox(height: 60.0),
                  Text(
                    'Sign In',
                    style: context.text.headlineLarge,
                  )
                ],
              ),
            ),
    );
  }
}
