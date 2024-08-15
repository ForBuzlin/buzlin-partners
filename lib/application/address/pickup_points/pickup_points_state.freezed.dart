// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_points_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PickupPointsState {
  List<DeliveryPointsData> get deliveryPoints =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  int get pickupIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PickupPointsStateCopyWith<PickupPointsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupPointsStateCopyWith<$Res> {
  factory $PickupPointsStateCopyWith(
          PickupPointsState value, $Res Function(PickupPointsState) then) =
      _$PickupPointsStateCopyWithImpl<$Res, PickupPointsState>;
  @useResult
  $Res call(
      {List<DeliveryPointsData> deliveryPoints,
      bool isLoading,
      Set<Marker> markers,
      int pickupIndex});
}

/// @nodoc
class _$PickupPointsStateCopyWithImpl<$Res, $Val extends PickupPointsState>
    implements $PickupPointsStateCopyWith<$Res> {
  _$PickupPointsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryPoints = null,
    Object? isLoading = null,
    Object? markers = null,
    Object? pickupIndex = null,
  }) {
    return _then(_value.copyWith(
      deliveryPoints: null == deliveryPoints
          ? _value.deliveryPoints
          : deliveryPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPointsData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      pickupIndex: null == pickupIndex
          ? _value.pickupIndex
          : pickupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickupPointsStateImplCopyWith<$Res>
    implements $PickupPointsStateCopyWith<$Res> {
  factory _$$PickupPointsStateImplCopyWith(_$PickupPointsStateImpl value,
          $Res Function(_$PickupPointsStateImpl) then) =
      __$$PickupPointsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DeliveryPointsData> deliveryPoints,
      bool isLoading,
      Set<Marker> markers,
      int pickupIndex});
}

/// @nodoc
class __$$PickupPointsStateImplCopyWithImpl<$Res>
    extends _$PickupPointsStateCopyWithImpl<$Res, _$PickupPointsStateImpl>
    implements _$$PickupPointsStateImplCopyWith<$Res> {
  __$$PickupPointsStateImplCopyWithImpl(_$PickupPointsStateImpl _value,
      $Res Function(_$PickupPointsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryPoints = null,
    Object? isLoading = null,
    Object? markers = null,
    Object? pickupIndex = null,
  }) {
    return _then(_$PickupPointsStateImpl(
      deliveryPoints: null == deliveryPoints
          ? _value._deliveryPoints
          : deliveryPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPointsData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      pickupIndex: null == pickupIndex
          ? _value.pickupIndex
          : pickupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PickupPointsStateImpl implements _PickupPointsState {
  const _$PickupPointsStateImpl(
      {final List<DeliveryPointsData> deliveryPoints = const [],
      this.isLoading = false,
      final Set<Marker> markers = const {},
      this.pickupIndex = -1})
      : _deliveryPoints = deliveryPoints,
        _markers = markers;

  final List<DeliveryPointsData> _deliveryPoints;
  @override
  @JsonKey()
  List<DeliveryPointsData> get deliveryPoints {
    if (_deliveryPoints is EqualUnmodifiableListView) return _deliveryPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryPoints);
  }

  @override
  @JsonKey()
  final bool isLoading;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  @JsonKey()
  final int pickupIndex;

  @override
  String toString() {
    return 'PickupPointsState(deliveryPoints: $deliveryPoints, isLoading: $isLoading, markers: $markers, pickupIndex: $pickupIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupPointsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._deliveryPoints, _deliveryPoints) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.pickupIndex, pickupIndex) ||
                other.pickupIndex == pickupIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_deliveryPoints),
      isLoading,
      const DeepCollectionEquality().hash(_markers),
      pickupIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupPointsStateImplCopyWith<_$PickupPointsStateImpl> get copyWith =>
      __$$PickupPointsStateImplCopyWithImpl<_$PickupPointsStateImpl>(
          this, _$identity);
}

abstract class _PickupPointsState implements PickupPointsState {
  const factory _PickupPointsState(
      {final List<DeliveryPointsData> deliveryPoints,
      final bool isLoading,
      final Set<Marker> markers,
      final int pickupIndex}) = _$PickupPointsStateImpl;

  @override
  List<DeliveryPointsData> get deliveryPoints;
  @override
  bool get isLoading;
  @override
  Set<Marker> get markers;
  @override
  int get pickupIndex;
  @override
  @JsonKey(ignore: true)
  _$$PickupPointsStateImplCopyWith<_$PickupPointsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
