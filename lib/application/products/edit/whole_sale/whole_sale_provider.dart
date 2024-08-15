import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'whole_sale_notifier.dart';
import 'whole_sale_state.dart';

final wholeSaleProvider =
    StateNotifierProvider.autoDispose<WholeSaleNotifier, WholeSaleState>(
  (ref) => WholeSaleNotifier(productRepository),
);
