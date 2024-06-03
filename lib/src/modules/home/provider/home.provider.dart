import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef HomeNotifier = AsyncNotifierProvider<HomeProvider, int>;

final homeProvider = HomeNotifier(HomeProvider.new);

class HomeProvider extends AsyncNotifier<int> {
  late int _index;
  @override
  FutureOr<int> build() async {
    _index = 0;
    return _index;
  }

  int get currentIndex => _index;

  void changeIndex(int index) {
    _index = index;
    ref.notifyListeners();
  }
}
