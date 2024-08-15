// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_gift_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddGiftCardState {
  bool get isLoading => throw _privateConstructorUsedError;
  GiftCardData? get giftCardData => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddGiftCardStateCopyWith<AddGiftCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddGiftCardStateCopyWith<$Res> {
  factory $AddGiftCardStateCopyWith(
          AddGiftCardState value, $Res Function(AddGiftCardState) then) =
      _$AddGiftCardStateCopyWithImpl<$Res, AddGiftCardState>;
  @useResult
  $Res call({bool isLoading, GiftCardData? giftCardData, bool active});
}

/// @nodoc
class _$AddGiftCardStateCopyWithImpl<$Res, $Val extends AddGiftCardState>
    implements $AddGiftCardStateCopyWith<$Res> {
  _$AddGiftCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? giftCardData = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      giftCardData: freezed == giftCardData
          ? _value.giftCardData
          : giftCardData // ignore: cast_nullable_to_non_nullable
              as GiftCardData?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddGiftCardStateImplCopyWith<$Res>
    implements $AddGiftCardStateCopyWith<$Res> {
  factory _$$AddGiftCardStateImplCopyWith(_$AddGiftCardStateImpl value,
          $Res Function(_$AddGiftCardStateImpl) then) =
      __$$AddGiftCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, GiftCardData? giftCardData, bool active});
}

/// @nodoc
class __$$AddGiftCardStateImplCopyWithImpl<$Res>
    extends _$AddGiftCardStateCopyWithImpl<$Res, _$AddGiftCardStateImpl>
    implements _$$AddGiftCardStateImplCopyWith<$Res> {
  __$$AddGiftCardStateImplCopyWithImpl(_$AddGiftCardStateImpl _value,
      $Res Function(_$AddGiftCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? giftCardData = freezed,
    Object? active = null,
  }) {
    return _then(_$AddGiftCardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      giftCardData: freezed == giftCardData
          ? _value.giftCardData
          : giftCardData // ignore: cast_nullable_to_non_nullable
              as GiftCardData?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddGiftCardStateImpl extends _AddGiftCardState {
  const _$AddGiftCardStateImpl(
      {this.isLoading = false, this.giftCardData, this.active = true})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final GiftCardData? giftCardData;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'AddGiftCardState(isLoading: $isLoading, giftCardData: $giftCardData, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddGiftCardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.giftCardData, giftCardData) ||
                other.giftCardData == giftCardData) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, giftCardData, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddGiftCardStateImplCopyWith<_$AddGiftCardStateImpl> get copyWith =>
      __$$AddGiftCardStateImplCopyWithImpl<_$AddGiftCardStateImpl>(
          this, _$identity);
}

abstract class _AddGiftCardState extends AddGiftCardState {
  const factory _AddGiftCardState(
      {final bool isLoading,
      final GiftCardData? giftCardData,
      final bool active}) = _$AddGiftCardStateImpl;
  const _AddGiftCardState._() : super._();

  @override
  bool get isLoading;
  @override
  GiftCardData? get giftCardData;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$AddGiftCardStateImplCopyWith<_$AddGiftCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
