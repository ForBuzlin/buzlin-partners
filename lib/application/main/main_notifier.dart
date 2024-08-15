import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier() : super(const MainState());

  void selectIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
