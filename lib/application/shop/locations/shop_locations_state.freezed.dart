// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_locations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopLocationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  List<ShopLocationData> get locations => throw _privateConstructorUsedError;
  int? get regionId => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  int? get cityId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopLocationsStateCopyWith<ShopLocationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopLocationsStateCopyWith<$Res> {
  factory $ShopLocationsStateCopyWith(
          ShopLocationsState value, $Res Function(ShopLocationsState) then) =
      _$ShopLocationsStateCopyWithImpl<$Res, ShopLocationsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      List<ShopLocationData> locations,
      int? regionId,
      int? countryId,
      int? cityId});
}

/// @nodoc
class _$ShopLocationsStateCopyWithImpl<$Res, $Val extends ShopLocationsState>
    implements $ShopLocationsStateCopyWith<$Res> {
  _$ShopLocationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? locations = null,
    Object? regionId = freezed,
    Object? countryId = freezed,
    Object? cityId = freezed,
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
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ShopLocationData>,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopLocationsStateImplCopyWith<$Res>
    implements $ShopLocationsStateCopyWith<$Res> {
  factory _$$ShopLocationsStateImplCopyWith(_$ShopLocationsStateImpl value,
          $Res Function(_$ShopLocationsStateImpl) then) =
      __$$ShopLocationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      List<ShopLocationData> locations,
      int? regionId,
      int? countryId,
      int? cityId});
}

/// @nodoc
class __$$ShopLocationsStateImplCopyWithImpl<$Res>
    extends _$ShopLocationsStateCopyWithImpl<$Res, _$ShopLocationsStateImpl>
    implements _$$ShopLocationsStateImplCopyWith<$Res> {
  __$$ShopLocationsStateImplCopyWithImpl(_$ShopLocationsStateImpl _value,
      $Res Function(_$ShopLocationsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? locations = null,
    Object? regionId = freezed,
    Object? countryId = freezed,
    Object? cityId = freezed,
  }) {
    return _then(_$ShopLocationsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ShopLocationData>,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ShopLocationsStateImpl extends _ShopLocationsState {
  const _$ShopLocationsStateImpl(
      {this.isLoading = false,
      this.isUpdating = false,
      final List<ShopLocationData> locations = const [],
      this.regionId,
      this.countryId,
      this.cityId})
      : _locations = locations,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  final List<ShopLocationData> _locations;
  @override
  @JsonKey()
  List<ShopLocationData> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  final int? regionId;
  @override
  final int? countryId;
  @override
  final int? cityId;

  @override
  String toString() {
    return 'ShopLocationsState(isLoading: $isLoading, isUpdating: $isUpdating, locations: $locations, regionId: $regionId, countryId: $countryId, cityId: $cityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopLocationsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isUpdating,
      const DeepCollectionEquality().hash(_locations),
      regionId,
      countryId,
      cityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopLocationsStateImplCopyWith<_$ShopLocationsStateImpl> get copyWith =>
      __$$ShopLocationsStateImplCopyWithImpl<_$ShopLocationsStateImpl>(
          this, _$identity);
}

abstract class _ShopLocationsState extends ShopLocationsState {
  const factory _ShopLocationsState(
      {final bool isLoading,
      final bool isUpdating,
      final List<ShopLocationData> locations,
      final int? regionId,
      final int? countryId,
      final int? cityId}) = _$ShopLocationsStateImpl;
  const _ShopLocationsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  List<ShopLocationData> get locations;
  @override
  int? get regionId;
  @override
  int? get countryId;
  @override
  int? get cityId;
  @override
  @JsonKey(ignore: true)
  _$$ShopLocationsStateImplCopyWith<_$ShopLocationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
