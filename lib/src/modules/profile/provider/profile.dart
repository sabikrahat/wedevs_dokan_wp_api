import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/profile.dart';
import '../../../utils/extensions/extensions.dart';

import '../../../config/constants.dart';
import '../api/profile.dart';

typedef ProfileNotifier = AsyncNotifierProvider<ProfileProvider, Profile?>;

final profileProvider = ProfileNotifier(ProfileProvider.new);

class ProfileProvider extends AsyncNotifier<Profile?> {
  final formKey = GlobalKey<FormState>();
  final expansionTileCntrlr = ExpansionTileController();
  bool _isProfileExpanded = false;
  final emailCntrlr = TextEditingController();
  final nameCntrlr = TextEditingController();
  final addressCntrlr = TextEditingController();
  final buildingCntrlr = TextEditingController();
  final zipCntrlr = TextEditingController();

  late Profile? _profile;
  @override
  FutureOr<Profile?> build() async {
    _profile = await getProfileApi();
    emailCntrlr.text = _profile?.email ?? '';
    nameCntrlr.text = _profile?.name ?? '';
    final list = _profile?.description?.split('_${appName.toCamelWord}_') ?? [];
    addressCntrlr.text = list.isEmpty ? '' : list.first;
    buildingCntrlr.text = list.length < 2 ? '' : list[1];
    zipCntrlr.text = list.length < 3 ? '' : list[2];
    return _profile;
  }

  bool get isProfileExpanded => _isProfileExpanded;

  void toggleProfileExpansion() {
    _isProfileExpanded = !_isProfileExpanded;
    ref.notifyListeners();
  }

  Profile? get profile => _profile;

  void setProfile(Profile p) {
    _profile = p;
    ref.notifyListeners();
  }

  String? get description {
    final address = addressCntrlr.text;
    final building = buildingCntrlr.text;
    final zip = zipCntrlr.text;
    return '${address}_${appName.toCamelWord}_${building}_${appName.toCamelWord}_$zip';
  }

  Future<void> updateProfile(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    await updateProfileApi(context, this);
  }
}
