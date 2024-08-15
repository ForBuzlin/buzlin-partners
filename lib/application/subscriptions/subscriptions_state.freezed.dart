// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscriptions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPaymentLoading => throw _privateConstructorUsedError;
  int get selectPayment => throw _privateConstructorUsedError;
  int get selectSubscribe => throw _privateConstructorUsedError;
  List<SubscriptionData> get list => throw _privateConstructorUsedError;
  List<PaymentData>? get payments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionStateCopyWith<SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res, SubscriptionState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isPaymentLoading,
      int selectPayment,
      int selectSubscribe,
      List<SubscriptionData> list,
      List<PaymentData>? payments});
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res, $Val extends SubscriptionState>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPaymentLoading = null,
    Object? selectPayment = null,
    Object? selectSubscribe = null,
    Object? list = null,
    Object? payments = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentLoading: null == isPaymentLoading
          ? _value.isPaymentLoading
          : isPaymentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectPayment: null == selectPayment
          ? _value.selectPayment
          : selectPayment // ignore: cast_nullable_to_non_nullable
              as int,
      selectSubscribe: null == selectSubscribe
          ? _value.selectSubscribe
          : selectSubscribe // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionData>,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionStateImplCopyWith<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  factory _$$SubscriptionStateImplCopyWith(_$SubscriptionStateImpl value,
          $Res Function(_$SubscriptionStateImpl) then) =
      __$$SubscriptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isPaymentLoading,
      int selectPayment,
      int selectSubscribe,
      List<SubscriptionData> list,
      List<PaymentData>? payments});
}

/// @nodoc
class __$$SubscriptionStateImplCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res, _$SubscriptionStateImpl>
    implements _$$SubscriptionStateImplCopyWith<$Res> {
  __$$SubscriptionStateImplCopyWithImpl(_$SubscriptionStateImpl _value,
      $Res Function(_$SubscriptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isPaymentLoading = null,
    Object? selectPayment = null,
    Object? selectSubscribe = null,
    Object? list = null,
    Object? payments = freezed,
  }) {
    return _then(_$SubscriptionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentLoading: null == isPaymentLoading
          ? _value.isPaymentLoading
          : isPaymentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectPayment: null == selectPayment
          ? _value.selectPayment
          : selectPayment // ignore: cast_nullable_to_non_nullable
              as int,
      selectSubscribe: null == selectSubscribe
          ? _value.selectSubscribe
          : selectSubscribe // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionData>,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
    ));
  }
}

/// @nodoc

class _$SubscriptionStateImpl extends _SubscriptionState {
  const _$SubscriptionStateImpl(
      {this.isLoading = false,
      this.isPaymentLoading = false,
      this.selectPayment = 1,
      this.selectSubscribe = 0,
      final List<SubscriptionData> list = const [],
      final List<PaymentData>? payments = const []})
      : _list = list,
        _payments = payments,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isPaymentLoading;
  @override
  @JsonKey()
  final int selectPayment;
  @override
  @JsonKey()
  final int selectSubscribe;
  final List<SubscriptionData> _list;
  @override
  @JsonKey()
  List<SubscriptionData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  final List<PaymentData>? _payments;
  @override
  @JsonKey()
  List<PaymentData>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubscriptionState(isLoading: $isLoading, isPaymentLoading: $isPaymentLoading, selectPayment: $selectPayment, selectSubscribe: $selectSubscribe, list: $list, payments: $payments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPaymentLoading, isPaymentLoading) ||
                other.isPaymentLoading == isPaymentLoading) &&
            (identical(other.selectPayment, selectPayment) ||
                other.selectPayment == selectPayment) &&
            (identical(other.selectSubscribe, selectSubscribe) ||
                other.selectSubscribe == selectSubscribe) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isPaymentLoading,
      selectPayment,
      selectSubscribe,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_payments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      __$$SubscriptionStateImplCopyWithImpl<_$SubscriptionStateImpl>(
          this, _$identity);
}

abstract class _SubscriptionState extends SubscriptionState {
  const factory _SubscriptionState(
      {final bool isLoading,
      final bool isPaymentLoading,
      final int selectPayment,
      final int selectSubscribe,
      final List<SubscriptionData> list,
      final List<PaymentData>? payments}) = _$SubscriptionStateImpl;
  const _SubscriptionState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isPaymentLoading;
  @override
  int get selectPayment;
  @override
  int get selectSubscribe;
  @override
  List<SubscriptionData> get list;
  @override
  List<PaymentData>? get payments;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionStateImplCopyWith<_$SubscriptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
