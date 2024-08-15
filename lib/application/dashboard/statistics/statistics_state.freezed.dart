// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatisticsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTopSaleLoading => throw _privateConstructorUsedError;
  bool get isRefresh => throw _privateConstructorUsedError;
  List<TopSaleProducts> get topSaleProducts =>
      throw _privateConstructorUsedError;
  List<ChartData> get chart => throw _privateConstructorUsedError;
  List<DateTime> get time => throw _privateConstructorUsedError;
  StatisticsData? get countData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
          StatisticsState value, $Res Function(StatisticsState) then) =
      _$StatisticsStateCopyWithImpl<$Res, StatisticsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isTopSaleLoading,
      bool isRefresh,
      List<TopSaleProducts> topSaleProducts,
      List<ChartData> chart,
      List<DateTime> time,
      StatisticsData? countData});
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res, $Val extends StatisticsState>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTopSaleLoading = null,
    Object? isRefresh = null,
    Object? topSaleProducts = null,
    Object? chart = null,
    Object? time = null,
    Object? countData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTopSaleLoading: null == isTopSaleLoading
          ? _value.isTopSaleLoading
          : isTopSaleLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      topSaleProducts: null == topSaleProducts
          ? _value.topSaleProducts
          : topSaleProducts // ignore: cast_nullable_to_non_nullable
              as List<TopSaleProducts>,
      chart: null == chart
          ? _value.chart
          : chart // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      countData: freezed == countData
          ? _value.countData
          : countData // ignore: cast_nullable_to_non_nullable
              as StatisticsData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsStateImplCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$$StatisticsStateImplCopyWith(_$StatisticsStateImpl value,
          $Res Function(_$StatisticsStateImpl) then) =
      __$$StatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isTopSaleLoading,
      bool isRefresh,
      List<TopSaleProducts> topSaleProducts,
      List<ChartData> chart,
      List<DateTime> time,
      StatisticsData? countData});
}

/// @nodoc
class __$$StatisticsStateImplCopyWithImpl<$Res>
    extends _$StatisticsStateCopyWithImpl<$Res, _$StatisticsStateImpl>
    implements _$$StatisticsStateImplCopyWith<$Res> {
  __$$StatisticsStateImplCopyWithImpl(
      _$StatisticsStateImpl _value, $Res Function(_$StatisticsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTopSaleLoading = null,
    Object? isRefresh = null,
    Object? topSaleProducts = null,
    Object? chart = null,
    Object? time = null,
    Object? countData = freezed,
  }) {
    return _then(_$StatisticsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTopSaleLoading: null == isTopSaleLoading
          ? _value.isTopSaleLoading
          : isTopSaleLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      topSaleProducts: null == topSaleProducts
          ? _value._topSaleProducts
          : topSaleProducts // ignore: cast_nullable_to_non_nullable
              as List<TopSaleProducts>,
      chart: null == chart
          ? _value._chart
          : chart // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
      time: null == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      countData: freezed == countData
          ? _value.countData
          : countData // ignore: cast_nullable_to_non_nullable
              as StatisticsData?,
    ));
  }
}

/// @nodoc

class _$StatisticsStateImpl extends _StatisticsState {
  const _$StatisticsStateImpl(
      {this.isLoading = false,
      this.isTopSaleLoading = false,
      this.isRefresh = true,
      final List<TopSaleProducts> topSaleProducts = const [],
      final List<ChartData> chart = const [],
      final List<DateTime> time = const [],
      this.countData})
      : _topSaleProducts = topSaleProducts,
        _chart = chart,
        _time = time,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTopSaleLoading;
  @override
  @JsonKey()
  final bool isRefresh;
  final List<TopSaleProducts> _topSaleProducts;
  @override
  @JsonKey()
  List<TopSaleProducts> get topSaleProducts {
    if (_topSaleProducts is EqualUnmodifiableListView) return _topSaleProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topSaleProducts);
  }

  final List<ChartData> _chart;
  @override
  @JsonKey()
  List<ChartData> get chart {
    if (_chart is EqualUnmodifiableListView) return _chart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chart);
  }

  final List<DateTime> _time;
  @override
  @JsonKey()
  List<DateTime> get time {
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_time);
  }

  @override
  final StatisticsData? countData;

  @override
  String toString() {
    return 'StatisticsState(isLoading: $isLoading, isTopSaleLoading: $isTopSaleLoading, isRefresh: $isRefresh, topSaleProducts: $topSaleProducts, chart: $chart, time: $time, countData: $countData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTopSaleLoading, isTopSaleLoading) ||
                other.isTopSaleLoading == isTopSaleLoading) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            const DeepCollectionEquality()
                .equals(other._topSaleProducts, _topSaleProducts) &&
            const DeepCollectionEquality().equals(other._chart, _chart) &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            (identical(other.countData, countData) ||
                other.countData == countData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isTopSaleLoading,
      isRefresh,
      const DeepCollectionEquality().hash(_topSaleProducts),
      const DeepCollectionEquality().hash(_chart),
      const DeepCollectionEquality().hash(_time),
      countData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      __$$StatisticsStateImplCopyWithImpl<_$StatisticsStateImpl>(
          this, _$identity);
}

abstract class _StatisticsState extends StatisticsState {
  const factory _StatisticsState(
      {final bool isLoading,
      final bool isTopSaleLoading,
      final bool isRefresh,
      final List<TopSaleProducts> topSaleProducts,
      final List<ChartData> chart,
      final List<DateTime> time,
      final StatisticsData? countData}) = _$StatisticsStateImpl;
  const _StatisticsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isTopSaleLoading;
  @override
  bool get isRefresh;
  @override
  List<TopSaleProducts> get topSaleProducts;
  @override
  List<ChartData> get chart;
  @override
  List<DateTime> get time;
  @override
  StatisticsData? get countData;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
