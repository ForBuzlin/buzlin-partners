// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BookingData> get bookings => throw _privateConstructorUsedError;
  int get selectMaster => throw _privateConstructorUsedError;
  int get calendarType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double get calendarZoom => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res, BookingState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<BookingData> bookings,
      int selectMaster,
      int calendarType,
      String? status,
      double calendarZoom,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookings = null,
    Object? selectMaster = null,
    Object? calendarType = null,
    Object? status = freezed,
    Object? calendarZoom = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookings: null == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<BookingData>,
      selectMaster: null == selectMaster
          ? _value.selectMaster
          : selectMaster // ignore: cast_nullable_to_non_nullable
              as int,
      calendarType: null == calendarType
          ? _value.calendarType
          : calendarType // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      calendarZoom: null == calendarZoom
          ? _value.calendarZoom
          : calendarZoom // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingStateImplCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$BookingStateImplCopyWith(
          _$BookingStateImpl value, $Res Function(_$BookingStateImpl) then) =
      __$$BookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<BookingData> bookings,
      int selectMaster,
      int calendarType,
      String? status,
      double calendarZoom,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$$BookingStateImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$BookingStateImpl>
    implements _$$BookingStateImplCopyWith<$Res> {
  __$$BookingStateImplCopyWithImpl(
      _$BookingStateImpl _value, $Res Function(_$BookingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookings = null,
    Object? selectMaster = null,
    Object? calendarType = null,
    Object? status = freezed,
    Object? calendarZoom = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$BookingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookings: null == bookings
          ? _value._bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<BookingData>,
      selectMaster: null == selectMaster
          ? _value.selectMaster
          : selectMaster // ignore: cast_nullable_to_non_nullable
              as int,
      calendarType: null == calendarType
          ? _value.calendarType
          : calendarType // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      calendarZoom: null == calendarZoom
          ? _value.calendarZoom
          : calendarZoom // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$BookingStateImpl extends _BookingState {
  const _$BookingStateImpl(
      {this.isLoading = false,
      final List<BookingData> bookings = const [],
      this.selectMaster = -1,
      this.calendarType = 0,
      this.status = null,
      this.calendarZoom = 2.2,
      this.startDate = null,
      this.endDate = null})
      : _bookings = bookings,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<BookingData> _bookings;
  @override
  @JsonKey()
  List<BookingData> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  @JsonKey()
  final int selectMaster;
  @override
  @JsonKey()
  final int calendarType;
  @override
  @JsonKey()
  final String? status;
  @override
  @JsonKey()
  final double calendarZoom;
  @override
  @JsonKey()
  final DateTime? startDate;
  @override
  @JsonKey()
  final DateTime? endDate;

  @override
  String toString() {
    return 'BookingState(isLoading: $isLoading, bookings: $bookings, selectMaster: $selectMaster, calendarType: $calendarType, status: $status, calendarZoom: $calendarZoom, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._bookings, _bookings) &&
            (identical(other.selectMaster, selectMaster) ||
                other.selectMaster == selectMaster) &&
            (identical(other.calendarType, calendarType) ||
                other.calendarType == calendarType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.calendarZoom, calendarZoom) ||
                other.calendarZoom == calendarZoom) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_bookings),
      selectMaster,
      calendarType,
      status,
      calendarZoom,
      startDate,
      endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      __$$BookingStateImplCopyWithImpl<_$BookingStateImpl>(this, _$identity);
}

abstract class _BookingState extends BookingState {
  const factory _BookingState(
      {final bool isLoading,
      final List<BookingData> bookings,
      final int selectMaster,
      final int calendarType,
      final String? status,
      final double calendarZoom,
      final DateTime? startDate,
      final DateTime? endDate}) = _$BookingStateImpl;
  const _BookingState._() : super._();

  @override
  bool get isLoading;
  @override
  List<BookingData> get bookings;
  @override
  int get selectMaster;
  @override
  int get calendarType;
  @override
  String? get status;
  @override
  double get calendarZoom;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
