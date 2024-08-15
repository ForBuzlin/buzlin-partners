import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'address_notifier.dart';
import 'address_state.dart';

final addressProvider = StateNotifierProvider<AddressNotifier, AddressState>(
  (ref) => AddressNotifier(addressRepository),
);
