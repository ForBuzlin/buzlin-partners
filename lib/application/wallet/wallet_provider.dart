import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'wallet_state.dart';
import 'wallet_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final walletProvider = StateNotifierProvider<WalletNotifier, WalletState>(
  (ref) => WalletNotifier(usersRepository, paymentRepository),
);
