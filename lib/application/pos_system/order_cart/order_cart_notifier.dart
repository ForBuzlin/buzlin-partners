import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'order_cart_state.dart';

class OrderCartNotifier extends StateNotifier<OrderCartState> {
  final OrdersFacade _ordersRepository;
  final AddressFacade _addressRepository;

  OrderCartNotifier(this._ordersRepository, this._addressRepository)
      : super(const OrderCartState());
  Timer? timer;

  void deleteProductCount({
    required int? id,
    Function(List<BagProductData>)? updateProducts,
  }) {
    List<Stocks>? listOfProduct = state.paginateResponse?.stocks;
    int productIndex = listOfProduct?.indexWhere((element) => element.id == id) ?? 0;
    listOfProduct?.removeAt(productIndex);
    PriceData? data = state.paginateResponse;
    PriceData? newData = data?.copyWith(stocks: listOfProduct);
    state = state.copyWith(paginateResponse: newData);
    final List<BagProductData> bagProducts =
        LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
    bagProducts.removeWhere((element) => element.stockId==id);

    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] =
        bags[state.selectedBagIndex].copyWith(bagProducts: bagProducts);
    LocalStorage.setBags(bags);
    fetchCarts(isCalculate: true);
    updateProducts?.call(bagProducts);
  }

  void clearBag(BuildContext context) {
    state = state.copyWith(
        paginateResponse: PriceData(), selectedUser: null, pickupAddress: null);
    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] = BagData();
    LocalStorage.setBags(bags);
  }

  void clearProductBag(BuildContext context) {
    state = state.copyWith(paginateResponse: PriceData());
    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] =
        bags[state.selectedBagIndex].copyWith(bagProducts: []);
    LocalStorage.setBags(bags);
  }

  void decreaseProductCount({
    required int productIndex,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) {
    timer?.cancel();
    Stocks? stock = state.paginateResponse?.stocks?[productIndex];
    if ((stock?.quantity ?? 1) > 1) {
      Stocks? stockProduct = stock?.copyWith(
        cartCount: ((stock.quantity ?? 0) - 1),
      );
      List<Stocks>? listOfProduct = state.paginateResponse?.stocks;
      listOfProduct?.removeAt(productIndex);
      listOfProduct?.insert(productIndex, stockProduct ?? Stocks());
      PriceData? data = state.paginateResponse;
      PriceData? newData = data?.copyWith(stocks: listOfProduct);
      state = state.copyWith(paginateResponse: newData);
      final List<BagProductData> bagProducts =
          LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
      for (int i = 0; i < bagProducts.length; i++) {
        if (bagProducts[i].stockId == stock?.id) {
          BagProductData newProductData = bagProducts[i]
              .copyWith(quantity: (bagProducts[i].quantity ?? 0) - 1);
          bagProducts.removeAt(i);
          bagProducts.insert(i, newProductData);
          break;
        }
      }

      List<BagData> bags = List.from(LocalStorage.getBags());
      bags[state.selectedBagIndex] =
          bags[state.selectedBagIndex].copyWith(bagProducts: bagProducts);
      LocalStorage.setBags(bags);
    } else {
      List<Stocks>? listOfProduct = state.paginateResponse?.stocks;
      listOfProduct?.removeAt(productIndex);
      PriceData? data = state.paginateResponse;
      PriceData? newData = data?.copyWith(stocks: listOfProduct);
      state = state.copyWith(paginateResponse: newData, totalPrice: 0);
      final List<BagProductData> bagProducts =
          LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
      for (int i = 0; i < bagProducts.length; i++) {
        if (bagProducts[i].stockId == stock?.id) {
          bagProducts.removeAt(i);
          break;
        }
      }

      List<BagData> bags = List.from(LocalStorage.getBags());
      bags[state.selectedBagIndex] =
          bags[state.selectedBagIndex].copyWith(bagProducts: bagProducts);
      LocalStorage.setBags(bags);
      if (bagProducts.isEmpty) {
        Navigator.pop(context);
      }
    }
    onSuccess.call();

    timer = Timer(
      const Duration(milliseconds: 500),
      () => fetchCarts(isCalculate: true),
    );
  }

  Future<void> increaseProductCount({
    required int productIndex,
    required VoidCallback onSuccess,
  }) async {
    timer?.cancel();
    Stocks? stock = state.paginateResponse?.stocks?[productIndex];
    Stocks? newStock = stock?.copyWith(
      cartCount: ((stock.quantity ?? 0) + 1),
    );
    List<Stocks>? listOfProduct = state.paginateResponse?.stocks;
    listOfProduct?.removeAt(productIndex);
    listOfProduct?.insert(productIndex, newStock ?? Stocks());
    PriceData? data = state.paginateResponse;
    PriceData? newData = data?.copyWith(stocks: listOfProduct);
    state = state.copyWith(paginateResponse: newData);
    final List<BagProductData> bagProducts =
        LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];

    for (int i = 0; i < bagProducts.length; i++) {
      if (bagProducts[i].stockId == stock?.id) {
        BagProductData newProductData = bagProducts[i]
            .copyWith(quantity: (bagProducts[i].quantity ?? 0) + 1);
        bagProducts.removeAt(i);
        bagProducts.insert(i, newProductData);
        break;
      }
    }

    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] =
        bags[state.selectedBagIndex].copyWith(bagProducts: bagProducts);
    await LocalStorage.setBags(bags);
    onSuccess.call();

    timer = Timer(
      const Duration(milliseconds: 500),
      () => fetchCarts(isCalculate: true),
    );
  }

  void addANewBag(context) {
    if (state.bags.length < 5) {
      List<BagData> newBags = List.from(state.bags);
      newBags.add(BagData(index: newBags.length, bagProducts: []));
      LocalStorage.setBags(newBags);
      state = state.copyWith(bags: newBags);
    } else {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.maxQuantity));
    }
  }

  void setSelectedBagIndex(int index) {
    state = state.copyWith(
      selectedBagIndex: index,
      selectedUser: state.bags[index].selectedUser,
      pickupAddress: state.bags[index].pickupAddress,
    );
    fetchCarts(isCalculate: true);
  }

  void removeBag(int index) {
    List<BagData> bags = List.from(state.bags);
    List<BagData> newBags = [];
    bags.removeAt(index);
    for (int i = 0; i < bags.length; i++) {
      newBags.add(BagData(index: i, bagProducts: bags[i].bagProducts));
    }
    LocalStorage.setBags(newBags);
    final int selectedIndex =
        state.selectedBagIndex == index ? 0 : state.selectedBagIndex;
    state = state.copyWith(bags: newBags, selectedBagIndex: selectedIndex);
  }

  void removeOrderedBag(BuildContext context) {
    List<BagData> bags = List.from(state.bags);
    List<BagData> newBags = [];
    bags.removeAt(state.selectedBagIndex);
    if (bags.isEmpty) {
      final BagData firstBag = BagData(index: 0, bagProducts: []);
      newBags = [firstBag];
    } else {
      for (int i = 0; i < bags.length; i++) {
        newBags.add(BagData(index: i, bagProducts: bags[i].bagProducts));
      }
    }
    LocalStorage.setBags(newBags);
    state = state.copyWith(
        bags: newBags,
        selectedBagIndex: 0,
        selectedUser: null,
        selectedAddress: null,
        selectedCurrency: null,
        selectedPayment: null,
        orderType: TrKeys.pickup);
    setInitialBagData(context, newBags[0]);
  }

  void setInitialBagData(BuildContext context, BagData bag) {
    state = state.copyWith(
        deliveryAddress: bag.deliveryAddress,
        selectedUser: bag.selectedUser,
        selectedCurrency: bag.selectedCurrency,
        selectedPayment: bag.selectedPayment,
        orderType: state.orderType.isEmpty ? TrKeys.pickup : state.orderType,
        pickupAddress: state.pickupAddress);
    fetchCarts(
      checkYourNetwork: () {
        AppHelpers.showNoConnectionSnackBar(context);
      },
    );
  }

  void setType(String type) {
    if (type == state.orderType) {
      return;
    } else {
      state = state.copyWith(orderType: type);
    }
  }

  Future<void> fetchCarts({
    VoidCallback? checkYourNetwork,
    bool isCalculate = false,
    bool isGetBag = true,
    VoidCallback? onSuccess,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isButtonLoading: true);
      BagData bag = LocalStorage.getBags()[state.selectedBagIndex];
      if (isGetBag) {
        state = state.copyWith(
            paginateResponse: null,
            bags: LocalStorage.getBags(),
            pickupAddress: bag.pickupAddress,
            deliveryAddress: bag.deliveryAddress,
            coupon: bag.coupon?.name,
            deliveryPrice: bag.deliveryAddress?.deliveryPrice,
            checkedCoupon: bag.coupon,
            selectedUser: bag.selectedUser);
      } else {
        bag = bag.copyWith(coupon: state.checkedCoupon ?? CouponData());
        List<BagData> bags = LocalStorage.getBags();
        bags[state.selectedBagIndex] = bag;
        LocalStorage.setBags(bags);
      }
      if (isCalculate) {
        final List<BagProductData> bagProducts = bag.bagProducts ?? [];
        if (bagProducts.isNotEmpty) {
          final response = await _ordersRepository.getAllCalculations(
              bag, state.orderType,
              bagIndex: state.selectedBagIndex);
          response.when(
            success: (data) async {
              if (state.orderType == TrKeys.delivery) {
                state = state.copyWith(
                  isButtonLoading: false,
                  isProductCalculateLoading: false,
                  paginateResponse: data.data?.copyWith(
                      deliveryFee: bag.deliveryAddress?.deliveryPrice?.price,
                      totalPrice: (data.data?.totalPrice ?? 0) +
                          (bag.deliveryAddress?.deliveryPrice?.price ?? 0)),
                  totalPrice: (data.data?.totalPrice ?? 0) +
                      (bag.deliveryAddress?.deliveryPrice?.price ?? 0),
                );
              } else {
                state = state.copyWith(
                  isButtonLoading: false,
                  isProductCalculateLoading: false,
                  paginateResponse: data.data,
                  totalPrice: data.data?.totalPrice ?? 0,
                );
              }

              for (int i = 0; i < bagProducts.length; i++) {
                int? quantity;
                data.data?.stocks?.forEach((e) {
                  if (e.id == bagProducts[i].stockId) {
                    quantity = e.quantity;
                  }
                });
                if (quantity != null) {
                  bagProducts[i] = bagProducts[i].copyWith(quantity: quantity);
                }
              }
              List<BagData> bags = LocalStorage.getBags();
              bags[state.selectedBagIndex] = bags[state.selectedBagIndex]
                  .copyWith(bagProducts: bagProducts);
              await LocalStorage.setBags(bags);
              onSuccess?.call();
            },
            failure: (failure, status) {
              state = state.copyWith(
                isProductCalculateLoading: false,
                isButtonLoading: false,
              );
              debugPrint('==> get product calculate failure: $failure');
            },
          );
        }
        state = state.copyWith(
          isButtonLoading: false,
          isProductCalculateLoading: false,
        );
      } else {
        state = state.copyWith(isButtonLoading: false);
      }
      onSuccess?.call();
    } else {
      checkYourNetwork?.call();
    }
  }

  setCoupon(String text) {
    state = state.copyWith(coupon: text);
    if (state.checkedCoupon != null) {
      state = state.copyWith(checkedCoupon: null);
      Delayed(milliseconds: 700).run(() async {
        fetchCarts(isCalculate: true, isGetBag: false);
      });
    }
  }

  checkCoupon({required BuildContext context}) async {
    if (state.coupon?.isEmpty ?? true) {
      return;
    }
    state = state.copyWith(isCouponLoading: true);
    final res = await _ordersRepository.checkCoupon(coupon: state.coupon!);
    res.when(success: (success) {
      List<BagData> bags = LocalStorage.getBags();
      bags[state.selectedBagIndex] =
          bags[state.selectedBagIndex].copyWith(coupon: success);
      LocalStorage.setBags(bags);
      state = state.copyWith(checkedCoupon: success, isCouponLoading: false);
      fetchCarts(isCalculate: true);
    }, failure: (failure, status) {
      if (state.checkedCoupon == null) {
        List<BagData> bags = LocalStorage.getBags();
        bags[state.selectedBagIndex] =
            bags[state.selectedBagIndex].copyWith(coupon: CouponData());
        LocalStorage.setBags(bags);
        state = state.copyWith(checkedCoupon: null);
      }
      state = state.copyWith(isCouponLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> placeOrder({
    VoidCallback? checkYourNetwork,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (state.selectedUser == null) {
        state = state.copyWith(selectUserError: TrKeys.selectUser);
        return;
      }
      if (state.selectedAddress == null &&
          (state.orderType == TrKeys.delivery)) {
        state = state.copyWith(
            selectAddressError: TrKeys.selectAddress, selectUserError: null);
        return;
      }
      if (state.selectedCurrency == null) {
        state = state.copyWith(
            selectCurrencyError: TrKeys.selectCurrency,
            selectUserError: null,
            selectAddressError: null);
        return;
      }
      if (state.selectedPayment == null) {
        state = state.copyWith(
            selectPaymentError: TrKeys.selectPayment,
            selectUserError: null,
            selectAddressError: null,
            selectCurrencyError: null);
        return;
      }
      state = state.copyWith(
          selectPaymentError: null,
          selectUserError: null,
          selectAddressError: null,
          selectCurrencyError: null);
    } else {
      checkYourNetwork?.call();
    }
  }

  void setCountry(CountryData? country) {
    List<BagData> bags = LocalStorage.getBags();
    bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
      pickupAddress: PickupAddress(country: country),
    );
    LocalStorage.setBags(bags);
    state = state.copyWith(
        pickupAddress: PickupAddress(country: country), bags: bags);
  }

  void getDeliveryPrices() async {
    final res = await _addressRepository.getDeliveryPrice(
      countryId: state.pickupAddress?.country?.id ?? 0,
      cityId: state.pickupAddress?.city?.id ?? 0,
    );
    res.when(
        success: (data) async {
          if (data.data?.isNotEmpty ?? false) {
            state = state.copyWith(deliveryPrice: data.data?.first);
            List<BagData> bags = LocalStorage.getBags();
            BagData bag = bags[state.selectedBagIndex];
            bag = bag.copyWith(
                deliveryAddress:
                MyAddress(deliveryPrice: state.deliveryPrice));
            bags[state.selectedBagIndex] = bag;
            await LocalStorage.setBags(bags);
            state = state.copyWith(
                deliveryAddress: bag.deliveryAddress, bags: bags);
          }
        },
        failure: (failure, status) {});
  }

  void setCity(CityData? city) {
    List<BagData> bags = LocalStorage.getBags();
    BagData bag = bags[state.selectedBagIndex];
    bag = bag.copyWith(pickupAddress: bag.pickupAddress?.copyWith(city: city));
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(pickupAddress: bag.pickupAddress, bags: bags);
  }

  Future<void> setPointAddress(DeliveryPointsData? deliveryPoint) async {
    List<BagData> bags = LocalStorage.getBags();
    BagData bag = bags[state.selectedBagIndex];
    bag = bag.copyWith(
        pickupAddress:
            bag.pickupAddress?.copyWith(deliveryPoint: deliveryPoint));
    bags[state.selectedBagIndex] = bag;
    await LocalStorage.setBags(bags);
    state = state.copyWith(pickupAddress: bag.pickupAddress, bags: bags);
    fetchCarts(isCalculate: true);
  }

  Future<void> setDeliveryAddress(MyAddress? deliveryAddress) async {
    List<BagData> bags = LocalStorage.getBags();
    BagData bag = bags[state.selectedBagIndex];
    bag = bag.copyWith(
        deliveryAddress:
            deliveryAddress?.copyWith(deliveryPrice: state.deliveryPrice));
    bags[state.selectedBagIndex] = bag;
    await LocalStorage.setBags(bags);
    state = state.copyWith(deliveryAddress: bag.deliveryAddress, bags: bags);
    fetchCarts(isCalculate: true);
  }

  void setSelectedUser(UserData? user) {
    if (user == null) return;
    List<BagData> bags = LocalStorage.getBags();
    BagData bag = bags[state.selectedBagIndex];
    bag = bag.copyWith(selectedUser: user);
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(selectedUser: bag.selectedUser, bags: bags);
  }

  void setPhone(String? phone) {
    List<BagData> bags = LocalStorage.getBags();
    BagData bag = bags[state.selectedBagIndex];
    bags[state.selectedBagIndex] = bag.copyWith(phone: phone);
    LocalStorage.setBags(bags);
    state = state.copyWith(bags: bags);
  }
}
