// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderCartState {
  num get totalPrice => throw _privateConstructorUsedError;
  bool get isBagsLoading => throw _privateConstructorUsedError;
  bool get isUsersLoading => throw _privateConstructorUsedError;
  bool get isUserDetailsLoading => throw _privateConstructorUsedError;
  bool get isCurrenciesLoading => throw _privateConstructorUsedError;
  bool get isPaymentsLoading => throw _privateConstructorUsedError;
  bool get isProductCalculateLoading => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isOrderLoading => throw _privateConstructorUsedError;
  bool get isCouponLoading => throw _privateConstructorUsedError;
  List<BagData> get bags => throw _privateConstructorUsedError;
  List<UserData> get users => throw _privateConstructorUsedError;
  List<CurrencyData> get currencies => throw _privateConstructorUsedError;
  List<PaymentData> get payments => throw _privateConstructorUsedError;
  int get selectedBagIndex => throw _privateConstructorUsedError;
  String get orderType => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String? get selectUserError => throw _privateConstructorUsedError;
  String? get selectAddressError => throw _privateConstructorUsedError;
  String? get selectCurrencyError => throw _privateConstructorUsedError;
  String? get selectPaymentError => throw _privateConstructorUsedError;
  String? get coupon => throw _privateConstructorUsedError;
  CouponData? get checkedCoupon => throw _privateConstructorUsedError;
  DateTime? get orderDate => throw _privateConstructorUsedError;
  TimeOfDay? get orderTime => throw _privateConstructorUsedError;
  UserData? get selectedUser => throw _privateConstructorUsedError;
  AddressData? get selectedAddress => throw _privateConstructorUsedError;
  PickupAddress? get pickupAddress => throw _privateConstructorUsedError;
  MyAddress? get deliveryAddress => throw _privateConstructorUsedError;
  CurrencyData? get selectedCurrency => throw _privateConstructorUsedError;
  PaymentData? get selectedPayment => throw _privateConstructorUsedError;
  PriceData? get paginateResponse => throw _privateConstructorUsedError;
  DeliveryPointsData? get deliveryPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCartStateCopyWith<OrderCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCartStateCopyWith<$Res> {
  factory $OrderCartStateCopyWith(
          OrderCartState value, $Res Function(OrderCartState) then) =
      _$OrderCartStateCopyWithImpl<$Res, OrderCartState>;
  @useResult
  $Res call(
      {num totalPrice,
      bool isBagsLoading,
      bool isUsersLoading,
      bool isUserDetailsLoading,
      bool isCurrenciesLoading,
      bool isPaymentsLoading,
      bool isProductCalculateLoading,
      bool isButtonLoading,
      bool isActive,
      bool isOrderLoading,
      bool isCouponLoading,
      List<BagData> bags,
      List<UserData> users,
      List<CurrencyData> currencies,
      List<PaymentData> payments,
      int selectedBagIndex,
      String orderType,
      String comment,
      String? selectUserError,
      String? selectAddressError,
      String? selectCurrencyError,
      String? selectPaymentError,
      String? coupon,
      CouponData? checkedCoupon,
      DateTime? orderDate,
      TimeOfDay? orderTime,
      UserData? selectedUser,
      AddressData? selectedAddress,
      PickupAddress? pickupAddress,
      MyAddress? deliveryAddress,
      CurrencyData? selectedCurrency,
      PaymentData? selectedPayment,
      PriceData? paginateResponse,
      DeliveryPointsData? deliveryPrice});
}

/// @nodoc
class _$OrderCartStateCopyWithImpl<$Res, $Val extends OrderCartState>
    implements $OrderCartStateCopyWith<$Res> {
  _$OrderCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPrice = null,
    Object? isBagsLoading = null,
    Object? isUsersLoading = null,
    Object? isUserDetailsLoading = null,
    Object? isCurrenciesLoading = null,
    Object? isPaymentsLoading = null,
    Object? isProductCalculateLoading = null,
    Object? isButtonLoading = null,
    Object? isActive = null,
    Object? isOrderLoading = null,
    Object? isCouponLoading = null,
    Object? bags = null,
    Object? users = null,
    Object? currencies = null,
    Object? payments = null,
    Object? selectedBagIndex = null,
    Object? orderType = null,
    Object? comment = null,
    Object? selectUserError = freezed,
    Object? selectAddressError = freezed,
    Object? selectCurrencyError = freezed,
    Object? selectPaymentError = freezed,
    Object? coupon = freezed,
    Object? checkedCoupon = freezed,
    Object? orderDate = freezed,
    Object? orderTime = freezed,
    Object? selectedUser = freezed,
    Object? selectedAddress = freezed,
    Object? pickupAddress = freezed,
    Object? deliveryAddress = freezed,
    Object? selectedCurrency = freezed,
    Object? selectedPayment = freezed,
    Object? paginateResponse = freezed,
    Object? deliveryPrice = freezed,
  }) {
    return _then(_value.copyWith(
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      isBagsLoading: null == isBagsLoading
          ? _value.isBagsLoading
          : isBagsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUsersLoading: null == isUsersLoading
          ? _value.isUsersLoading
          : isUsersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserDetailsLoading: null == isUserDetailsLoading
          ? _value.isUserDetailsLoading
          : isUserDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrenciesLoading: null == isCurrenciesLoading
          ? _value.isCurrenciesLoading
          : isCurrenciesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentsLoading: null == isPaymentsLoading
          ? _value.isPaymentsLoading
          : isPaymentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isProductCalculateLoading: null == isProductCalculateLoading
          ? _value.isProductCalculateLoading
          : isProductCalculateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrderLoading: null == isOrderLoading
          ? _value.isOrderLoading
          : isOrderLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: null == isCouponLoading
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bags: null == bags
          ? _value.bags
          : bags // ignore: cast_nullable_to_non_nullable
              as List<BagData>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      selectedBagIndex: null == selectedBagIndex
          ? _value.selectedBagIndex
          : selectedBagIndex // ignore: cast_nullable_to_non_nullable
              as int,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      selectUserError: freezed == selectUserError
          ? _value.selectUserError
          : selectUserError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectAddressError: freezed == selectAddressError
          ? _value.selectAddressError
          : selectAddressError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectCurrencyError: freezed == selectCurrencyError
          ? _value.selectCurrencyError
          : selectCurrencyError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectPaymentError: freezed == selectPaymentError
          ? _value.selectPaymentError
          : selectPaymentError // ignore: cast_nullable_to_non_nullable
              as String?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedCoupon: freezed == checkedCoupon
          ? _value.checkedCoupon
          : checkedCoupon // ignore: cast_nullable_to_non_nullable
              as CouponData?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderTime: freezed == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as AddressData?,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as PickupAddress?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as MyAddress?,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyData?,
      selectedPayment: freezed == selectedPayment
          ? _value.selectedPayment
          : selectedPayment // ignore: cast_nullable_to_non_nullable
              as PaymentData?,
      paginateResponse: freezed == paginateResponse
          ? _value.paginateResponse
          : paginateResponse // ignore: cast_nullable_to_non_nullable
              as PriceData?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as DeliveryPointsData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCartStateImplCopyWith<$Res>
    implements $OrderCartStateCopyWith<$Res> {
  factory _$$OrderCartStateImplCopyWith(_$OrderCartStateImpl value,
          $Res Function(_$OrderCartStateImpl) then) =
      __$$OrderCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num totalPrice,
      bool isBagsLoading,
      bool isUsersLoading,
      bool isUserDetailsLoading,
      bool isCurrenciesLoading,
      bool isPaymentsLoading,
      bool isProductCalculateLoading,
      bool isButtonLoading,
      bool isActive,
      bool isOrderLoading,
      bool isCouponLoading,
      List<BagData> bags,
      List<UserData> users,
      List<CurrencyData> currencies,
      List<PaymentData> payments,
      int selectedBagIndex,
      String orderType,
      String comment,
      String? selectUserError,
      String? selectAddressError,
      String? selectCurrencyError,
      String? selectPaymentError,
      String? coupon,
      CouponData? checkedCoupon,
      DateTime? orderDate,
      TimeOfDay? orderTime,
      UserData? selectedUser,
      AddressData? selectedAddress,
      PickupAddress? pickupAddress,
      MyAddress? deliveryAddress,
      CurrencyData? selectedCurrency,
      PaymentData? selectedPayment,
      PriceData? paginateResponse,
      DeliveryPointsData? deliveryPrice});
}

/// @nodoc
class __$$OrderCartStateImplCopyWithImpl<$Res>
    extends _$OrderCartStateCopyWithImpl<$Res, _$OrderCartStateImpl>
    implements _$$OrderCartStateImplCopyWith<$Res> {
  __$$OrderCartStateImplCopyWithImpl(
      _$OrderCartStateImpl _value, $Res Function(_$OrderCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPrice = null,
    Object? isBagsLoading = null,
    Object? isUsersLoading = null,
    Object? isUserDetailsLoading = null,
    Object? isCurrenciesLoading = null,
    Object? isPaymentsLoading = null,
    Object? isProductCalculateLoading = null,
    Object? isButtonLoading = null,
    Object? isActive = null,
    Object? isOrderLoading = null,
    Object? isCouponLoading = null,
    Object? bags = null,
    Object? users = null,
    Object? currencies = null,
    Object? payments = null,
    Object? selectedBagIndex = null,
    Object? orderType = null,
    Object? comment = null,
    Object? selectUserError = freezed,
    Object? selectAddressError = freezed,
    Object? selectCurrencyError = freezed,
    Object? selectPaymentError = freezed,
    Object? coupon = freezed,
    Object? checkedCoupon = freezed,
    Object? orderDate = freezed,
    Object? orderTime = freezed,
    Object? selectedUser = freezed,
    Object? selectedAddress = freezed,
    Object? pickupAddress = freezed,
    Object? deliveryAddress = freezed,
    Object? selectedCurrency = freezed,
    Object? selectedPayment = freezed,
    Object? paginateResponse = freezed,
    Object? deliveryPrice = freezed,
  }) {
    return _then(_$OrderCartStateImpl(
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      isBagsLoading: null == isBagsLoading
          ? _value.isBagsLoading
          : isBagsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUsersLoading: null == isUsersLoading
          ? _value.isUsersLoading
          : isUsersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserDetailsLoading: null == isUserDetailsLoading
          ? _value.isUserDetailsLoading
          : isUserDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrenciesLoading: null == isCurrenciesLoading
          ? _value.isCurrenciesLoading
          : isCurrenciesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentsLoading: null == isPaymentsLoading
          ? _value.isPaymentsLoading
          : isPaymentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isProductCalculateLoading: null == isProductCalculateLoading
          ? _value.isProductCalculateLoading
          : isProductCalculateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrderLoading: null == isOrderLoading
          ? _value.isOrderLoading
          : isOrderLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCouponLoading: null == isCouponLoading
          ? _value.isCouponLoading
          : isCouponLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bags: null == bags
          ? _value._bags
          : bags // ignore: cast_nullable_to_non_nullable
              as List<BagData>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
      payments: null == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      selectedBagIndex: null == selectedBagIndex
          ? _value.selectedBagIndex
          : selectedBagIndex // ignore: cast_nullable_to_non_nullable
              as int,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      selectUserError: freezed == selectUserError
          ? _value.selectUserError
          : selectUserError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectAddressError: freezed == selectAddressError
          ? _value.selectAddressError
          : selectAddressError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectCurrencyError: freezed == selectCurrencyError
          ? _value.selectCurrencyError
          : selectCurrencyError // ignore: cast_nullable_to_non_nullable
              as String?,
      selectPaymentError: freezed == selectPaymentError
          ? _value.selectPaymentError
          : selectPaymentError // ignore: cast_nullable_to_non_nullable
              as String?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedCoupon: freezed == checkedCoupon
          ? _value.checkedCoupon
          : checkedCoupon // ignore: cast_nullable_to_non_nullable
              as CouponData?,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderTime: freezed == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as AddressData?,
      pickupAddress: freezed == pickupAddress
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as PickupAddress?,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as MyAddress?,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyData?,
      selectedPayment: freezed == selectedPayment
          ? _value.selectedPayment
          : selectedPayment // ignore: cast_nullable_to_non_nullable
              as PaymentData?,
      paginateResponse: freezed == paginateResponse
          ? _value.paginateResponse
          : paginateResponse // ignore: cast_nullable_to_non_nullable
              as PriceData?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as DeliveryPointsData?,
    ));
  }
}

/// @nodoc

class _$OrderCartStateImpl extends _OrderCartState {
  const _$OrderCartStateImpl(
      {this.totalPrice = 0,
      this.isBagsLoading = false,
      this.isUsersLoading = false,
      this.isUserDetailsLoading = false,
      this.isCurrenciesLoading = false,
      this.isPaymentsLoading = false,
      this.isProductCalculateLoading = false,
      this.isButtonLoading = false,
      this.isActive = false,
      this.isOrderLoading = false,
      this.isCouponLoading = false,
      final List<BagData> bags = const [],
      final List<UserData> users = const [],
      final List<CurrencyData> currencies = const [],
      final List<PaymentData> payments = const [],
      this.selectedBagIndex = 0,
      this.orderType = '',
      this.comment = '',
      this.selectUserError = null,
      this.selectAddressError = null,
      this.selectCurrencyError = null,
      this.selectPaymentError = null,
      this.coupon = null,
      this.checkedCoupon = null,
      this.orderDate = null,
      this.orderTime = null,
      this.selectedUser,
      this.selectedAddress,
      this.pickupAddress,
      this.deliveryAddress,
      this.selectedCurrency,
      this.selectedPayment,
      this.paginateResponse,
      this.deliveryPrice})
      : _bags = bags,
        _users = users,
        _currencies = currencies,
        _payments = payments,
        super._();

  @override
  @JsonKey()
  final num totalPrice;
  @override
  @JsonKey()
  final bool isBagsLoading;
  @override
  @JsonKey()
  final bool isUsersLoading;
  @override
  @JsonKey()
  final bool isUserDetailsLoading;
  @override
  @JsonKey()
  final bool isCurrenciesLoading;
  @override
  @JsonKey()
  final bool isPaymentsLoading;
  @override
  @JsonKey()
  final bool isProductCalculateLoading;
  @override
  @JsonKey()
  final bool isButtonLoading;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isOrderLoading;
  @override
  @JsonKey()
  final bool isCouponLoading;
  final List<BagData> _bags;
  @override
  @JsonKey()
  List<BagData> get bags {
    if (_bags is EqualUnmodifiableListView) return _bags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bags);
  }

  final List<UserData> _users;
  @override
  @JsonKey()
  List<UserData> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<CurrencyData> _currencies;
  @override
  @JsonKey()
  List<CurrencyData> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  final List<PaymentData> _payments;
  @override
  @JsonKey()
  List<PaymentData> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  @override
  @JsonKey()
  final int selectedBagIndex;
  @override
  @JsonKey()
  final String orderType;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String? selectUserError;
  @override
  @JsonKey()
  final String? selectAddressError;
  @override
  @JsonKey()
  final String? selectCurrencyError;
  @override
  @JsonKey()
  final String? selectPaymentError;
  @override
  @JsonKey()
  final String? coupon;
  @override
  @JsonKey()
  final CouponData? checkedCoupon;
  @override
  @JsonKey()
  final DateTime? orderDate;
  @override
  @JsonKey()
  final TimeOfDay? orderTime;
  @override
  final UserData? selectedUser;
  @override
  final AddressData? selectedAddress;
  @override
  final PickupAddress? pickupAddress;
  @override
  final MyAddress? deliveryAddress;
  @override
  final CurrencyData? selectedCurrency;
  @override
  final PaymentData? selectedPayment;
  @override
  final PriceData? paginateResponse;
  @override
  final DeliveryPointsData? deliveryPrice;

  @override
  String toString() {
    return 'OrderCartState(totalPrice: $totalPrice, isBagsLoading: $isBagsLoading, isUsersLoading: $isUsersLoading, isUserDetailsLoading: $isUserDetailsLoading, isCurrenciesLoading: $isCurrenciesLoading, isPaymentsLoading: $isPaymentsLoading, isProductCalculateLoading: $isProductCalculateLoading, isButtonLoading: $isButtonLoading, isActive: $isActive, isOrderLoading: $isOrderLoading, isCouponLoading: $isCouponLoading, bags: $bags, users: $users, currencies: $currencies, payments: $payments, selectedBagIndex: $selectedBagIndex, orderType: $orderType, comment: $comment, selectUserError: $selectUserError, selectAddressError: $selectAddressError, selectCurrencyError: $selectCurrencyError, selectPaymentError: $selectPaymentError, coupon: $coupon, checkedCoupon: $checkedCoupon, orderDate: $orderDate, orderTime: $orderTime, selectedUser: $selectedUser, selectedAddress: $selectedAddress, pickupAddress: $pickupAddress, deliveryAddress: $deliveryAddress, selectedCurrency: $selectedCurrency, selectedPayment: $selectedPayment, paginateResponse: $paginateResponse, deliveryPrice: $deliveryPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCartStateImpl &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.isBagsLoading, isBagsLoading) ||
                other.isBagsLoading == isBagsLoading) &&
            (identical(other.isUsersLoading, isUsersLoading) ||
                other.isUsersLoading == isUsersLoading) &&
            (identical(other.isUserDetailsLoading, isUserDetailsLoading) ||
                other.isUserDetailsLoading == isUserDetailsLoading) &&
            (identical(other.isCurrenciesLoading, isCurrenciesLoading) ||
                other.isCurrenciesLoading == isCurrenciesLoading) &&
            (identical(other.isPaymentsLoading, isPaymentsLoading) ||
                other.isPaymentsLoading == isPaymentsLoading) &&
            (identical(other.isProductCalculateLoading,
                    isProductCalculateLoading) ||
                other.isProductCalculateLoading == isProductCalculateLoading) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isOrderLoading, isOrderLoading) ||
                other.isOrderLoading == isOrderLoading) &&
            (identical(other.isCouponLoading, isCouponLoading) ||
                other.isCouponLoading == isCouponLoading) &&
            const DeepCollectionEquality().equals(other._bags, _bags) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.selectedBagIndex, selectedBagIndex) ||
                other.selectedBagIndex == selectedBagIndex) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.selectUserError, selectUserError) ||
                other.selectUserError == selectUserError) &&
            (identical(other.selectAddressError, selectAddressError) ||
                other.selectAddressError == selectAddressError) &&
            (identical(other.selectCurrencyError, selectCurrencyError) ||
                other.selectCurrencyError == selectCurrencyError) &&
            (identical(other.selectPaymentError, selectPaymentError) ||
                other.selectPaymentError == selectPaymentError) &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.checkedCoupon, checkedCoupon) ||
                other.checkedCoupon == checkedCoupon) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.orderTime, orderTime) ||
                other.orderTime == orderTime) &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency) &&
            (identical(other.selectedPayment, selectedPayment) ||
                other.selectedPayment == selectedPayment) &&
            (identical(other.paginateResponse, paginateResponse) ||
                other.paginateResponse == paginateResponse) &&
            (identical(other.deliveryPrice, deliveryPrice) ||
                other.deliveryPrice == deliveryPrice));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        totalPrice,
        isBagsLoading,
        isUsersLoading,
        isUserDetailsLoading,
        isCurrenciesLoading,
        isPaymentsLoading,
        isProductCalculateLoading,
        isButtonLoading,
        isActive,
        isOrderLoading,
        isCouponLoading,
        const DeepCollectionEquality().hash(_bags),
        const DeepCollectionEquality().hash(_users),
        const DeepCollectionEquality().hash(_currencies),
        const DeepCollectionEquality().hash(_payments),
        selectedBagIndex,
        orderType,
        comment,
        selectUserError,
        selectAddressError,
        selectCurrencyError,
        selectPaymentError,
        coupon,
        checkedCoupon,
        orderDate,
        orderTime,
        selectedUser,
        selectedAddress,
        pickupAddress,
        deliveryAddress,
        selectedCurrency,
        selectedPayment,
        paginateResponse,
        deliveryPrice
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCartStateImplCopyWith<_$OrderCartStateImpl> get copyWith =>
      __$$OrderCartStateImplCopyWithImpl<_$OrderCartStateImpl>(
          this, _$identity);
}

abstract class _OrderCartState extends OrderCartState {
  const factory _OrderCartState(
      {final num totalPrice,
      final bool isBagsLoading,
      final bool isUsersLoading,
      final bool isUserDetailsLoading,
      final bool isCurrenciesLoading,
      final bool isPaymentsLoading,
      final bool isProductCalculateLoading,
      final bool isButtonLoading,
      final bool isActive,
      final bool isOrderLoading,
      final bool isCouponLoading,
      final List<BagData> bags,
      final List<UserData> users,
      final List<CurrencyData> currencies,
      final List<PaymentData> payments,
      final int selectedBagIndex,
      final String orderType,
      final String comment,
      final String? selectUserError,
      final String? selectAddressError,
      final String? selectCurrencyError,
      final String? selectPaymentError,
      final String? coupon,
      final CouponData? checkedCoupon,
      final DateTime? orderDate,
      final TimeOfDay? orderTime,
      final UserData? selectedUser,
      final AddressData? selectedAddress,
      final PickupAddress? pickupAddress,
      final MyAddress? deliveryAddress,
      final CurrencyData? selectedCurrency,
      final PaymentData? selectedPayment,
      final PriceData? paginateResponse,
      final DeliveryPointsData? deliveryPrice}) = _$OrderCartStateImpl;
  const _OrderCartState._() : super._();

  @override
  num get totalPrice;
  @override
  bool get isBagsLoading;
  @override
  bool get isUsersLoading;
  @override
  bool get isUserDetailsLoading;
  @override
  bool get isCurrenciesLoading;
  @override
  bool get isPaymentsLoading;
  @override
  bool get isProductCalculateLoading;
  @override
  bool get isButtonLoading;
  @override
  bool get isActive;
  @override
  bool get isOrderLoading;
  @override
  bool get isCouponLoading;
  @override
  List<BagData> get bags;
  @override
  List<UserData> get users;
  @override
  List<CurrencyData> get currencies;
  @override
  List<PaymentData> get payments;
  @override
  int get selectedBagIndex;
  @override
  String get orderType;
  @override
  String get comment;
  @override
  String? get selectUserError;
  @override
  String? get selectAddressError;
  @override
  String? get selectCurrencyError;
  @override
  String? get selectPaymentError;
  @override
  String? get coupon;
  @override
  CouponData? get checkedCoupon;
  @override
  DateTime? get orderDate;
  @override
  TimeOfDay? get orderTime;
  @override
  UserData? get selectedUser;
  @override
  AddressData? get selectedAddress;
  @override
  PickupAddress? get pickupAddress;
  @override
  MyAddress? get deliveryAddress;
  @override
  CurrencyData? get selectedCurrency;
  @override
  PaymentData? get selectedPayment;
  @override
  PriceData? get paginateResponse;
  @override
  DeliveryPointsData? get deliveryPrice;
  @override
  @JsonKey(ignore: true)
  _$$OrderCartStateImplCopyWith<_$OrderCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
