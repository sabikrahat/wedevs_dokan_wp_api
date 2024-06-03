import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../config/url.dart';
import '../../../db/isar.dart';
import '../../auth/api/auth.api.dart';
import '../model/profile.dart';
import '../provider/profile.dart';

import '../../../shared/show_toast/awsome.snackbar/awesome.snackbar.dart';
import '../../../shared/show_toast/awsome.snackbar/show.awesome.snackbar.dart';
import '../../../utils/logger/logger_helper.dart';

Future<Profile?> getProfileApi() async {
  if (appUser == null) throw Exception('You are not logged in.');
  try {
    var headers = {'Authorization': 'Bearer ${appUser!.token}'};
    var request = http.Request('POST', Uri.parse('$baseUrl/wp/v2/users/me'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    final body = json.decode(res);

    if (response.statusCode == 200) {
      log.i('profileApi response: $body');
      return Profile.fromJson(body);
    } else {
      log.e('profileApi response: $body');
      throw Exception(body['message']);
    }
  } on SocketException catch (e) {
    throw Exception('No Internet Connection. $e');
  } on ClientException catch (e) {
    throw Exception('Client Exception. $e');
  } catch (e) {
    throw Exception('Unknown Error. $e');
  }
}

Future<void> updateProfileApi(
  BuildContext context,
  ProfileProvider notifier,
) async {
  if (appUser == null) throw Exception('You are not logged in.');
  try {
    EasyLoading.show(status: 'Updating...');
    var headers = {'Authorization': 'Bearer ${appUser!.token}'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/wp/v2/users/me?email=${notifier.emailCntrlr.text.trim()}&name=${notifier.nameCntrlr.text.trim()}&description=${notifier.description}'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final res = await response.stream.bytesToString();
    final body = json.decode(res);

    if (response.statusCode == 200) {
      log.i('updateProfileApi response: $body');
      notifier.setProfile(Profile.fromJson(body));
      EasyLoading.dismiss();
      if (!context.mounted) return;
      showAwesomeSnackbar(context, 'Success!', 'Profile updated successfully!',
          MessageType.success);
      return;
    } else {
      log.e('updateProfileApi response: $body');
      EasyLoading.dismiss();
      if (!context.mounted) return;
      showAwesomeSnackbar(context, 'Failed!', removeHtmlTags(body['message']),
          MessageType.failure);
      return;
    }
  } on SocketException catch (e) {
    EasyLoading.showError('No Internet Connection. $e');
    return;
  } on ClientException catch (e) {
    log.e('User update: $e');
    if (!context.mounted) return;
    showAwesomeSnackbar(
        context, 'Failed!', removeHtmlTags(e.message), MessageType.failure);
    return;
  } catch (e) {
    log.e('User update: $e');
    if (!context.mounted) return;
    showAwesomeSnackbar(
        context, 'Failed!', removeHtmlTags(e.toString()), MessageType.failure);
    return;
  }
}
