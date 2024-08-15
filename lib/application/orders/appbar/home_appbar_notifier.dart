import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_appbar_state.dart';

class HomeAppbarNotifier extends StateNotifier<HomeAppbarState> {
  HomeAppbarNotifier() : super(const HomeAppbarState());

  void setAppbarDetails(int? index) {
    state = state.copyWith(index: index ?? 0);
  }
}
