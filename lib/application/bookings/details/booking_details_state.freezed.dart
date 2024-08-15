// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isUpdateNote => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  BookingData? get bookingData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingDetailsStateCopyWith<BookingDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDetailsStateCopyWith<$Res> {
  factory $BookingDetailsStateCopyWith(
          BookingDetailsState value, $Res Function(BookingDetailsState) then) =
      _$BookingDetailsStateCopyWithImpl<$Res, BookingDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      bool isUpdateNote,
      int selectedIndex,
      BookingData? bookingData});
}

/// @nodoc
class _$BookingDetailsStateCopyWithImpl<$Res, $Val extends BookingDetailsState>
    implements $BookingDetailsStateCopyWith<$Res> {
  _$BookingDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? isUpdateNote = null,
    Object? selectedIndex = null,
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
      isUpdateNote: null == isUpdateNote
          ? _value.isUpdateNote
          : isUpdateNote // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      bookingData: freezed == bookingData
          ? _value.bookingData
          : bookingData // ignore: cast_nullable_to_non_nullable
              as BookingData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDetailsStateImplCopyWith<$Res>
    implements $BookingDetailsStateCopyWith<$Res> {
  factory _$$BookingDetailsStateImplCopyWith(_$BookingDetailsStateImpl value,
          $Res Function(_$BookingDetailsStateImpl) then) =
      __$$BookingDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      bool isUpdateNote,
      int selectedIndex,
      BookingData? bookingData});
}

/// @nodoc
class __$$BookingDetailsStateImplCopyWithImpl<$Res>
    extends _$BookingDetailsStateCopyWithImpl<$Res, _$BookingDetailsStateImpl>
    implements _$$BookingDetailsStateImplCopyWith<$Res> {
  __$$BookingDetailsStateImplCopyWithImpl(_$BookingDetailsStateImpl _value,
      $Res Function(_$BookingDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? isUpdateNote = null,
    Object? selectedIndex = null,
    Object? bookingData = freezed,
  }) {
    return _then(_$BookingDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateNote: null == isUpdateNote
          ? _value.isUpdateNote
          : isUpdateNote // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      bookingData: freezed == bookingData
          ? _value.bookingData
          : bookingData // ignore: cast_nullable_to_non_nullable
              as BookingData?,
    ));
  }
}

/// @nodoc

class _$BookingDetailsStateImpl extends _BookingDetailsState {
  const _$BookingDetailsStateImpl(
      {this.isLoading = false,
      this.isUpdating = false,
      this.isUpdateNote = false,
      this.selectedIndex = 0,
      this.bookingData = null})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isUpdateNote;
  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final BookingData? bookingData;

  @override
  String toString() {
    return 'BookingDetailsState(isLoading: $isLoading, isUpdating: $isUpdating, isUpdateNote: $isUpdateNote, selectedIndex: $selectedIndex, bookingData: $bookingData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isUpdateNote, isUpdateNote) ||
                other.isUpdateNote == isUpdateNote) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.bookingData, bookingData) ||
                other.bookingData == bookingData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isUpdating,
      isUpdateNote, selectedIndex, bookingData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDetailsStateImplCopyWith<_$BookingDetailsStateImpl> get copyWith =>
      __$$BookingDetailsStateImplCopyWithImpl<_$BookingDetailsStateImpl>(
          this, _$identity);
}

abstract class _BookingDetailsState extends BookingDetailsState {
  const factory _BookingDetailsState(
      {final bool isLoading,
      final bool isUpdating,
      final bool isUpdateNote,
      final int selectedIndex,
      final BookingData? bookingData}) = _$BookingDetailsStateImpl;
  const _BookingDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  bool get isUpdateNote;
  @override
  int get selectedIndex;
  @override
  BookingData? get bookingData;
  @override
  @JsonKey(ignore: true)
  _$$BookingDetailsStateImplCopyWith<_$BookingDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
