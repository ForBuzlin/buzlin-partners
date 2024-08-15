// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditBookingState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  BookingData? get bookingData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditBookingStateCopyWith<EditBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditBookingStateCopyWith<$Res> {
  factory $EditBookingStateCopyWith(
          EditBookingState value, $Res Function(EditBookingState) then) =
      _$EditBookingStateCopyWithImpl<$Res, EditBookingState>;
  @useResult
  $Res call({bool isLoading, bool isUpdating, BookingData? bookingData});
}

/// @nodoc
class _$EditBookingStateCopyWithImpl<$Res, $Val extends EditBookingState>
    implements $EditBookingStateCopyWith<$Res> {
  _$EditBookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? bookingData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingData: freezed == bookingData
          ? _value.bookingData
          : bookingData // ignore: cast_nullable_to_non_nullable
              as BookingData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditBookingStateImplCopyWith<$Res>
    implements $EditBookingStateCopyWith<$Res> {
  factory _$$EditBookingStateImplCopyWith(_$EditBookingStateImpl value,
          $Res Function(_$EditBookingStateImpl) then) =
      __$$EditBookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isUpdating, BookingData? bookingData});
}

/// @nodoc
class __$$EditBookingStateImplCopyWithImpl<$Res>
    extends _$EditBookingStateCopyWithImpl<$Res, _$EditBookingStateImpl>
    implements _$$EditBookingStateImplCopyWith<$Res> {
  __$$EditBookingStateImplCopyWithImpl(_$EditBookingStateImpl _value,
      $Res Function(_$EditBookingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? bookingData = freezed,
  }) {
    return _then(_$EditBookingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingData: freezed == bookingData
          ? _value.bookingData
          : bookingData // ignore: cast_nullable_to_non_nullable
              as BookingData?,
    ));
  }
}

/// @nodoc

class _$EditBookingStateImpl extends _EditBookingState {
  const _$EditBookingStateImpl(
      {this.isLoading = false, this.isUpdating = false, this.bookingData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  final BookingData? bookingData;

  @override
  String toString() {
    return 'EditBookingState(isLoading: $isLoading, isUpdating: $isUpdating, bookingData: $bookingData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditBookingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.bookingData, bookingData) ||
                other.bookingData == bookingData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isUpdating, bookingData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditBookingStateImplCopyWith<_$EditBookingStateImpl> get copyWith =>
      __$$EditBookingStateImplCopyWithImpl<_$EditBookingStateImpl>(
          this, _$identity);
}

abstract class _EditBookingState extends EditBookingState {
  const factory _EditBookingState(
      {final bool isLoading,
      final bool isUpdating,
      final BookingData? bookingData}) = _$EditBookingStateImpl;
  const _EditBookingState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  BookingData? get bookingData;
  @override
  @JsonKey(ignore: true)
  _$$EditBookingStateImplCopyWith<_$EditBookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
