import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/pages/profile/transactions/maksekeskus_screen.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'wallet_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class WalletNotifier extends StateNotifier<WalletState> {
  final UsersFacade _userRepository;
  final PaymentsFacade _paymentsRepo;
  int page = 0;
  int searchPage = 0;

  WalletNotifier(this._userRepository, this._paymentsRepo)
      : super(const WalletState());

  fetchTransactions(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      page = 0;
      state = state.copyWith(transactions: [], isTransactionLoading: true);
    }
    final res = await _userRepository.getTransactions(++page);
    res.when(success: (data) {
      List<TransactionModel> list = List.from(state.transactions);
      list.addAll(data.data ?? []);
      state = state.copyWith(isTransactionLoading: false, transactions: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, s) {
      if (isRefresh ?? false) {
        controller?.refreshFailed();
        return;
      }
      controller?.loadFailed();
      state = state.copyWith(isTransactionLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  searchUser(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller,
      required String search}) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      searchPage = 0;
      state = state.copyWith(listOfUser: [], isSearchingLoading: true);
    }

    final res =
        await _userRepository.searchUsers(query: search, page: ++searchPage);
    res.when(success: (data) {
      List<UserData> list = List.from(state.listOfUser ?? []);
      list.addAll(data.data ?? []);
      state = state.copyWith(listOfUser: list, isSearchingLoading: false);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, s) {
      state = state.copyWith(isSearchingLoading: false);
      if (isRefresh ?? false) {
        controller?.refreshFailed();
        return;
      }
      controller?.loadFailed();
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  fetchPayments({required BuildContext context}) async {
    final res = await _paymentsRepo.getPayments();
    res.when(success: (data) {
      List<PaymentData> list = [];
      for (int i = 0; i < (data.data?.length ?? 0); i++) {
        if (data.data?[i].tag != "cash" && data.data?[i].tag != "wallet") {
          list.add(data.data?[i] ?? PaymentData());
        }
      }
      state = state.copyWith(list: list, selectPayment: 0);
    }, failure: (failure, s) {
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  selectPayment({required int index}) {
    state = state.copyWith(selectPayment: index);
  }

  fetchMaksekeskus(BuildContext context, num price) async {
    state = state.copyWith(isMaksekeskusLoading: true);
    final res = await _paymentsRepo.paymentMaksekeskusView(price: price);
    res.when(success: (l) async {
      state = state.copyWith(isMaksekeskusLoading: false, maksekeskus: l.data);
    }, failure: (failure, s) {
      state = state.copyWith(isMaksekeskusLoading: false);
      AppHelpers.errorSnackBar(context,text: failure);
    });
  }

  fillWallet(
      {required BuildContext context,
      required VoidCallback onSuccess,
      required String price}) async {
    if (state.list?[state.selectPayment].tag == 'maksekeskus') {
      AppHelpers.showCustomModalBottomSheet(
          context: context,
          modal: MaksekeskusScreen(
            price: double.tryParse(price) ?? 0,
            onSuccess: (url) async {
              await context
                  .pushRoute(WebViewRoute(url: url))
                  .whenComplete(() => onSuccess());
            },
          ));
      return;
    }
    state = state.copyWith(isButtonLoading: true);
    final res = await _paymentsRepo.paymentWalletWebView(
        name: state.list?[state.selectPayment].tag ?? "",
        price: double.tryParse(price) ?? 0);
    res.when(success: (data) async {
      state = state.copyWith(isButtonLoading: false);
      await context
          .pushRoute(WebViewRoute(url: data))
          .whenComplete(() => onSuccess());
    }, failure: (failure, s) {
      state = state.copyWith(isButtonLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  sendWallet(
      {required BuildContext context,
      required String price,
      required VoidCallback onSuccess,
      required String uuid}) async {
    if ((double.tryParse(price) ?? 0) == 0) {
      return;
    }
    state = state.copyWith(isButtonLoading: true);
    final res = await _paymentsRepo.sendWallet(
        uuid: uuid, price: double.tryParse(price) ?? 0);
    res.when(success: (data) async {
      state = state.copyWith(isButtonLoading: false);
      onSuccess();
    }, failure: (failure, s) {
      state = state.copyWith(isButtonLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }
}
