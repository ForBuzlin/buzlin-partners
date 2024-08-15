// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditServiceState {
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  ServiceData? get serviceData => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<Galleries> get listOfUrls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditServiceStateCopyWith<EditServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditServiceStateCopyWith<$Res> {
  factory $EditServiceStateCopyWith(
          EditServiceState value, $Res Function(EditServiceState) then) =
      _$EditServiceStateCopyWithImpl<$Res, EditServiceState>;
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      bool isUpdating,
      ServiceData? serviceData,
      List<String> images,
      List<Galleries> listOfUrls});
}

/// @nodoc
class _$EditServiceStateCopyWithImpl<$Res, $Val extends EditServiceState>
    implements $EditServiceStateCopyWith<$Res> {
  _$EditServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? serviceData = freezed,
    Object? images = null,
    Object? listOfUrls = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceData: freezed == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as ServiceData?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listOfUrls: null == listOfUrls
          ? _value.listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditServiceStateImplCopyWith<$Res>
    implements $EditServiceStateCopyWith<$Res> {
  factory _$$EditServiceStateImplCopyWith(_$EditServiceStateImpl value,
          $Res Function(_$EditServiceStateImpl) then) =
      __$$EditServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      bool isUpdating,
      ServiceData? serviceData,
      List<String> images,
      List<Galleries> listOfUrls});
}

/// @nodoc
class __$$EditServiceStateImplCopyWithImpl<$Res>
    extends _$EditServiceStateCopyWithImpl<$Res, _$EditServiceStateImpl>
    implements _$$EditServiceStateImplCopyWith<$Res> {
  __$$EditServiceStateImplCopyWithImpl(_$EditServiceStateImpl _value,
      $Res Function(_$EditServiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? serviceData = freezed,
    Object? images = null,
    Object? listOfUrls = null,
  }) {
    return _then(_$EditServiceStateImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceData: freezed == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as ServiceData?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listOfUrls: null == listOfUrls
          ? _value._listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
    ));
  }
}

/// @nodoc

class _$EditServiceStateImpl extends _EditServiceState {
  const _$EditServiceStateImpl(
      {this.active = true,
      this.isLoading = false,
      this.isUpdating = false,
      this.serviceData,
      final List<String> images = const [],
      final List<Galleries> listOfUrls = const []})
      : _images = images,
        _listOfUrls = listOfUrls,
        super._();

  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  final ServiceData? serviceData;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Galleries> _listOfUrls;
  @override
  @JsonKey()
  List<Galleries> get listOfUrls {
    if (_listOfUrls is EqualUnmodifiableListView) return _listOfUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfUrls);
  }

  @override
  String toString() {
    return 'EditServiceState(active: $active, isLoading: $isLoading, isUpdating: $isUpdating, serviceData: $serviceData, images: $images, listOfUrls: $listOfUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditServiceStateImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.serviceData, serviceData) ||
                other.serviceData == serviceData) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._listOfUrls, _listOfUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      active,
      isLoading,
      isUpdating,
      serviceData,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_listOfUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditServiceStateImplCopyWith<_$EditServiceStateImpl> get copyWith =>
      __$$EditServiceStateImplCopyWithImpl<_$EditServiceStateImpl>(
          this, _$identity);
}

abstract class _EditServiceState extends EditServiceState {
  const factory _EditServiceState(
      {final bool active,
      final bool isLoading,
      final bool isUpdating,
      final ServiceData? serviceData,
      final List<String> images,
      final List<Galleries> listOfUrls}) = _$EditServiceStateImpl;
  const _EditServiceState._() : super._();

  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  ServiceData? get serviceData;
  @override
  List<String> get images;
  @override
  List<Galleries> get listOfUrls;
  @override
  @JsonKey(ignore: true)
  _$$EditServiceStateImplCopyWith<_$EditServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
