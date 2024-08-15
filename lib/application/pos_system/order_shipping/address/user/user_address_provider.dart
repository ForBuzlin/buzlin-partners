import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'user_address_state.dart';
import 'user_address_notifier.dart';

final userAddressProvider =
    StateNotifierProvider<UserAddressNotifier, UserAddressState>(
  (ref) => UserAddressNotifier(addressRepository),
);
