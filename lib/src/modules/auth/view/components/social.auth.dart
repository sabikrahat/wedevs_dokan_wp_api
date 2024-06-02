import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants.dart';
import '../../provider/auth.provider.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth(this.notifier, {super.key});

  final AuthProvider notifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          Container(
            height: 56.0,
            width: 56.0,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius12,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.grey.shade100,
                  offset: const Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: SvgPicture.asset('assets/svgs/facebook.svg'),
          ),
          const SizedBox(width: 20.0),
          Container(
            height: 56.0,
            width: 56.0,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius12,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.grey.shade100,
                  offset: const Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: SvgPicture.asset('assets/svgs/google.svg'),
          ),
        ],
      ),
    );
  }
}
