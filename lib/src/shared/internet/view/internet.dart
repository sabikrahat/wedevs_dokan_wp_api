import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/constants.dart';
import '../../../utils/extensions/extensions.dart';
import '../provider/internet.dart';

class InternetBarWidget extends ConsumerWidget {
  const InternetBarWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(isConnectedPd);
    return isConnected
        ? const SizedBox()
        : _NoInternetBarWidget(message ?? 'No internet connection');
  }
}

class _NoInternetBarWidget extends StatelessWidget {
  const _NoInternetBarWidget(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25.0,
      color: Colors.red[100],
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          Icon(
            Icons.wifi_off,
            color: Colors.red[900],
            size: 15.0,
          ),
          const SizedBox(width: 5.0),
          Text(
            message,
            style: context.text.labelMedium!.copyWith(
              color: Colors.red[900],
            ),
          ),
        ],
      ),
    );
  }
}

class InternetWidget extends ConsumerWidget {
  const InternetWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(isConnectedPd);
    return isConnected
        ? child
        : Scaffold(
            body: Center(
              child: SizedBox(
                width: min(context.width * 0.95, 500),
                child: Column(
                  mainAxisSize: mainMin,
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.red, size: 150.0),
                    const SizedBox(height: 20.0),
                    Text(
                      'No Internet',
                      style: context.text.titleLarge,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Your device is not connected to the internet. Please check your connection! Will automatically reconnect when the internet is available.',
                      style: context.text.bodyLarge!.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
