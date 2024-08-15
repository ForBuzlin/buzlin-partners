import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_membership_state.dart';

class EditMembershipNotifier extends StateNotifier<EditMembershipState> {
  final MembershipFacade _membershipRepository;

  EditMembershipNotifier(this._membershipRepository)
      : super(const EditMembershipState());

  void clear() {
    state = state.copyWith(services: []);
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

  Future<void> fetchMembershipDetails(
      {required BuildContext context,
      required MembershipData? membership}) async {
    state = state.copyWith(isLoading: true, membership: membership);
    final res =
        await _membershipRepository.getMembershipsDetails(membership?.id);
    res.when(success: (data) {
      List<ServiceData> list = [];
      list.addAll(data.data?.services ?? []);
      state = state.copyWith(
          isLoading: false, services: list, membership: data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateMembership(
    BuildContext context, {
    required String title,
    required String description,
    required String term,
    required String price,
    required String sessionCount,
    ValueChanged<MembershipData?>? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _membershipRepository.updateMembership(
      title: title,
      description: description,
      id: state.membership?.id ?? 0,
      term: term,
      color: state.membership?.color,
      time: state.membership?.time,
      services: state.services.map((e) => e.id).toList(),
      price: num.tryParse(price) ?? 0,
      sessions: int.tryParse(sessionCount),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, services: []);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> update membership failure: $failure');
        failed?.call();
      },
    );
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
