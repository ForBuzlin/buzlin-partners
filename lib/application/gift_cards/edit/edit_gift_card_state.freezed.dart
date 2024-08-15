// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_gift_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditGiftCardState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  GiftCardData? get giftCardData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditGiftCardStateCopyWith<EditGiftCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditGiftCardStateCopyWith<$Res> {
  factory $EditGiftCardStateCopyWith(
          EditGiftCardState value, $Res Function(EditGiftCardState) then) =
      _$EditGiftCardStateCopyWithImpl<$Res, EditGiftCardState>;
  @useResult
  $Res call({bool isLoading, bool active, GiftCardData? giftCardData});
}

/// @nodoc
class _$EditGiftCardStateCopyWithImpl<$Res, $Val extends EditGiftCardState>
    implements $EditGiftCardStateCopyWith<$Res> {
  _$EditGiftCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? active = null,
    Object? giftCardData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      giftCardData: freezed == giftCardData
          ? _value.giftCardData
          : giftCardData // ignore: cast_nullable_to_non_nullable
              as GiftCardData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditGiftCardStateImplCopyWith<$Res>
    implements $EditGiftCardStateCopyWith<$Res> {
  factory _$$EditGiftCardStateImplCopyWith(_$EditGiftCardStateImpl value,
          $Res Function(_$EditGiftCardStateImpl) then) =
      __$$EditGiftCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool active, GiftCardData? giftCardData});
}

/// @nodoc
class __$$EditGiftCardStateImplCopyWithImpl<$Res>
    extends _$EditGiftCardStateCopyWithImpl<$Res, _$EditGiftCardStateImpl>
    implements _$$EditGiftCardStateImplCopyWith<$Res> {
  __$$EditGiftCardStateImplCopyWithImpl(_$EditGiftCardStateImpl _value,
      $Res Function(_$EditGiftCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? active = null,
    Object? giftCardData = freezed,
  }) {
    return _then(_$EditGiftCardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      giftCardData: freezed == giftCardData
          ? _value.giftCardData
          : giftCardData // ignore: cast_nullable_to_non_nullable
              as GiftCardData?,
    ));
  }
}

/// @nodoc

class _$EditGiftCardStateImpl extends _EditGiftCardState {
  const _$EditGiftCardStateImpl(
      {this.isLoading = false, this.active = true, this.giftCardData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool active;
  @override
  final GiftCardData? giftCardData;

  @override
  String toString() {
    return 'EditGiftCardState(isLoading: $isLoading, active: $active, giftCardData: $giftCardData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditGiftCardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.giftCardData, giftCardData) ||
                other.giftCardData == giftCardData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, active, giftCardData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditGiftCardStateImplCopyWith<_$EditGiftCardStateImpl> get copyWith =>
      __$$EditGiftCardStateImplCopyWithImpl<_$EditGiftCardStateImpl>(
          this, _$identity);
}

abstract class _EditGiftCardState extends EditGiftCardState {
  const factory _EditGiftCardState(
      {final bool isLoading,
      final bool active,
      final GiftCardData? giftCardData}) = _$EditGiftCardStateImpl;
  const _EditGiftCardState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get active;
  @override
  GiftCardData? get giftCardData;
  @override
  @JsonKey(ignore: true)
  _$$EditGiftCardStateImplCopyWith<_$EditGiftCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
