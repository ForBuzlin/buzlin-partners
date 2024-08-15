import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  switchScreen(int i) {
    state = state.copyWith(selectIndex: i);
  }
}
