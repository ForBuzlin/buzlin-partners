import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'delivery_time_state.dart';

class DeliveryTimeNotifier extends StateNotifier<DeliveryTimeState> {
  DeliveryTimeNotifier()
      : super(
          DeliveryTimeState(
              deliveryDate:
                  DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())),
        );

  void setDeliveryDate(String date) {
    state = state.copyWith(deliveryDate: date);
  }
}
