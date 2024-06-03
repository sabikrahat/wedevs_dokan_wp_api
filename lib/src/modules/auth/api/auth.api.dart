import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../config/url.dart';
import '../../../db/isar.dart';
import '../../../router.dart';
import '../../../shared/show_toast/awsome.snackbar/awesome.snackbar.dart';
import '../../../shared/show_toast/awsome.snackbar/show.awesome.snackbar.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/logger/logger_helper.dart';
import '../model/user.dart';
import '../provider/auth.provider.dart';

Future<void> signupApi(BuildContext context, AuthProvider notifier,
    [bool autoSignin = true]) async {
  EasyLoading.show(status: 'Creating account...');
  try {
    //
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseUrl/wp/v2/users/register'));
    request.body = json.encode({
      "username": notifier.nameCntrlr.text,
      "email": notifier.emailCntrlr.text,
      "password": notifier.pwdCntrlr.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    final body = json.decode(res);

    if (response.statusCode == 200) {
      log.i('signupApi response: $body');
      if (!context.mounted) return;
      if (autoSignin) {
        await signinApi(context, notifier);
      } else {
        notifier.isSignup = false;
        notifier.clear();
        showAwesomeSnackbar(context, 'Success!',
            removeHtmlTags(body['message']), MessageType.success);
      }
      return;
    } else {
      log.e('signupApi response: $body');
      if (!context.mounted) return;
      showAwesomeSnackbar(
          context, 'Failed!', removeHtmlTags(body['message']), MessageType.failure);
    }
    //
    EasyLoading.dismiss();
    return;
  } on SocketException catch (e) {
    EasyLoading.showError('No Internet Connection. $e');
    return;
  } on ClientException catch (e) {
    log.e('User Signup: $e');
    if (!context.mounted) return;
    showAwesomeSnackbar(
        context, 'Failed!', removeHtmlTags(e.message), MessageType.failure);
    return;
  }
}

Future<void> signinApi(BuildContext context, AuthProvider notifier) async {
  EasyLoading.show(status: 'Matching Credentials...');
  try {
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/jwt-auth/v1/token?username=${notifier.emailCntrlr.text.trim()}&password=${notifier.pwdCntrlr.text.trim()}'));

    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    final body = json.decode(res);

    if (response.statusCode == 200) {
      log.i('signinApi response: $body');
      await User.fromJson(body).save();
      if (!context.mounted) return;
      notifier.clear();
      EasyLoading.dismiss();
      await context.pushRemoveUntil(const AppRouter());
      return;
    } else {
      log.e('signinApi response: $body');
      if (!context.mounted) return;
      showAwesomeSnackbar(context, 'Failed!', removeHtmlTags(body['message']),
          MessageType.failure);
    }
    return;
  } on SocketException catch (e) {
    EasyLoading.showError('No Internet Connection. $e');
    return;
  } on ClientException catch (e) {
    log.e('User signin: $e');
    if (!context.mounted) return;
    showAwesomeSnackbar(
        context, 'Failed!', removeHtmlTags(e.message), MessageType.failure);
    return;
  }
}

Future<void> signoutApi(BuildContext context) async {
  EasyLoading.show(status: 'Signing out...');
  try {
    //
    if (appUser != null) {
      await appUser!.delete().then((value) async {
        EasyLoading.showSuccess('Logout successful');
        await context.pushRemoveUntil(const AppRouter());
      });
    } else {
      EasyLoading.showError('You are not logged in');
      context.pop();
    }
    return;
  } on SocketException catch (e) {
    EasyLoading.showError('No Internet Connection. $e');
    return;
  } on ClientException catch (e) {
    log.e('User signout: $e');
    if (!context.mounted) return;
    showAwesomeSnackbar(context, 'Failed!', e.message, MessageType.failure);
    return;
  }
}

String removeHtmlTags(String? htmlString) {
  final regExp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  return htmlString?.replaceAll(regExp, '') ?? 'An error occurred.';
}
