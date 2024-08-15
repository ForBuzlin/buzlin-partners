import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_membership_state.dart';

class AddMembershipNotifier extends StateNotifier<AddMembershipState> {
  final MembershipFacade _membershipRepository;

  AddMembershipNotifier(
    this._membershipRepository,
  ) : super(const AddMembershipState());

  Future<void> createMembership(
    BuildContext context, {
    required String title,
    required String description,
    required String term,
    required String price,
    required String sessionCount,
    ValueChanged<MembershipData?>? created,
    VoidCallback? onError,
  }) async {
    if (state.services.isEmpty) {
      AppHelpers.errorSnackBar(
        context,
        text: AppHelpers.getTranslation(TrKeys.errorQuantity),
      );
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _membershipRepository.addMembership(
      title: title,
      description: description,
      term: term,
      color: state.membership?.color,
      time: state.membership?.time,
      services: state.services.map((e) => e.id).toList(),
      price: num.tryParse(price) ?? 0,
      sessions: int.tryParse(sessionCount),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        created?.call(data.data);
      },
      failure: (failure, status) {
        debugPrint('===> create membership failure: $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
      },
    );
  }

  void clear() {
    state = state.copyWith(services: [], membership: MembershipData());
  }

  void deleteService(int? id) {
    List<ServiceData> list = List.from(state.services);
    list.removeWhere((element) => element.id == id);
    state = state.copyWith(services: list);
  }

  void setServices(ServiceData service) {
    List<ServiceData> list = List.from(state.services);
    if (state.services.any((element) => element.id == service.id)) {
      list.removeWhere((element) => element.id == service.id);
    } else {
      list.add(service);
    }
    state = state.copyWith(services: list);
  }

  void setTime(String time) {
    state = state.copyWith(membership: state.membership?.copyWith(time: time));
  }

  void setSession(String session) {
    state = state.copyWith(
      membership: state.membership
          ?.copyWith(sessions: DropDownValues.sessionsList.indexOf(session) + 1),
    );
  }

  void setColor(Color color) {
    state =
        state.copyWith(membership: state.membership?.copyWith(color: color));
  }
}
