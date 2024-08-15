// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddServiceState {
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ServiceData? get serviceData => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<Galleries> get listOfUrls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddServiceStateCopyWith<AddServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServiceStateCopyWith<$Res> {
  factory $AddServiceStateCopyWith(
          AddServiceState value, $Res Function(AddServiceState) then) =
      _$AddServiceStateCopyWithImpl<$Res, AddServiceState>;
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      ServiceData? serviceData,
      List<String> images,
      List<Galleries> listOfUrls});
}

/// @nodoc
class _$AddServiceStateCopyWithImpl<$Res, $Val extends AddServiceState>
    implements $AddServiceStateCopyWith<$Res> {
  _$AddServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
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
abstract class _$$AddServiceStateImplCopyWith<$Res>
    implements $AddServiceStateCopyWith<$Res> {
  factory _$$AddServiceStateImplCopyWith(_$AddServiceStateImpl value,
          $Res Function(_$AddServiceStateImpl) then) =
      __$$AddServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      bool isLoading,
      ServiceData? serviceData,
      List<String> images,
      List<Galleries> listOfUrls});
}

/// @nodoc
class __$$AddServiceStateImplCopyWithImpl<$Res>
    extends _$AddServiceStateCopyWithImpl<$Res, _$AddServiceStateImpl>
    implements _$$AddServiceStateImplCopyWith<$Res> {
  __$$AddServiceStateImplCopyWithImpl(
      _$AddServiceStateImpl _value, $Res Function(_$AddServiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? isLoading = null,
    Object? serviceData = freezed,
    Object? images = null,
    Object? listOfUrls = null,
  }) {
    return _then(_$AddServiceStateImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$AddServiceStateImpl extends _AddServiceState {
  const _$AddServiceStateImpl(
      {this.active = true,
      this.isLoading = false,
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
    return 'AddServiceState(active: $active, isLoading: $isLoading, serviceData: $serviceData, images: $images, listOfUrls: $listOfUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServiceStateImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
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
      serviceData,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_listOfUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServiceStateImplCopyWith<_$AddServiceStateImpl> get copyWith =>
      __$$AddServiceStateImplCopyWithImpl<_$AddServiceStateImpl>(
          this, _$identity);
}

abstract class _AddServiceState extends AddServiceState {
  const factory _AddServiceState(
      {final bool active,
      final bool isLoading,
      final ServiceData? serviceData,
      final List<String> images,
      final List<Galleries> listOfUrls}) = _$AddServiceStateImpl;
  const _AddServiceState._() : super._();

  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  ServiceData? get serviceData;
  @override
  List<String> get images;
  @override
  List<Galleries> get listOfUrls;
  @override
  @JsonKey(ignore: true)
  _$$AddServiceStateImplCopyWith<_$AddServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
