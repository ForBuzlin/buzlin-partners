import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'activity_item.dart';

class BookingActivityBody extends ConsumerWidget {
  const BookingActivityBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(bookingDetailsProvider);
    return (state.bookingData?.activities?.isEmpty ?? true)
        ? const NoItem(title: TrKeys.noActivities)
        : ListView.builder(
            padding: REdgeInsets.only(left: 16,right: 16,top: 16,bottom: 100),
            itemCount: state.bookingData?.activities?.length ?? 0,
            itemBuilder: (context, index) {
              return ActivityItem(
                activity: state.bookingData?.activities?[index],
              );
            });
  }
}
