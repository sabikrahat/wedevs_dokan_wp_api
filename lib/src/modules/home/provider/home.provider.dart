import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef HomeNotifier = NotifierProvider<HomeProvider, int>;

final homeProvider = HomeNotifier(HomeProvider.new);

class HomeProvider extends Notifier<int> {
  late int _index;
  @override
  int build() {
    _index = 0;
    return _index;
  }

  int get currentIndex => _index;

  void changeIndex(int index) {
    _index = index;
    ref.notifyListeners();
  }
}
