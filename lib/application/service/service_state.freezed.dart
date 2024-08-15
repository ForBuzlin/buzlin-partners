// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ServiceData> get allServices => throw _privateConstructorUsedError;
  List<ServiceData> get services => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceStateCopyWith<ServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<ServiceData> allServices,
      List<ServiceData> services});
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allServices = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allServices: null == allServices
          ? _value.allServices
          : allServices // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceStateImplCopyWith(
          _$ServiceStateImpl value, $Res Function(_$ServiceStateImpl) then) =
      __$$ServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<ServiceData> allServices,
      List<ServiceData> services});
}

/// @nodoc
class __$$ServiceStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceStateImpl>
    implements _$$ServiceStateImplCopyWith<$Res> {
  __$$ServiceStateImplCopyWithImpl(
      _$ServiceStateImpl _value, $Res Function(_$ServiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allServices = null,
    Object? services = null,
  }) {
    return _then(_$ServiceStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allServices: null == allServices
          ? _value._allServices
          : allServices // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
    ));
  }
}

/// @nodoc

class _$ServiceStateImpl extends _ServiceState {
  const _$ServiceStateImpl(
      {this.isLoading = false,
      final List<ServiceData> allServices = const [],
      final List<ServiceData> services = const []})
      : _allServices = allServices,
        _services = services,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ServiceData> _allServices;
  @override
  @JsonKey()
  List<ServiceData> get allServices {
    if (_allServices is EqualUnmodifiableListView) return _allServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allServices);
  }

  final List<ServiceData> _services;
  @override
  @JsonKey()
  List<ServiceData> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'ServiceState(isLoading: $isLoading, allServices: $allServices, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._allServices, _allServices) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_allServices),
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceStateImplCopyWith<_$ServiceStateImpl> get copyWith =>
      __$$ServiceStateImplCopyWithImpl<_$ServiceStateImpl>(this, _$identity);
}

abstract class _ServiceState extends ServiceState {
  const factory _ServiceState(
      {final bool isLoading,
      final List<ServiceData> allServices,
      final List<ServiceData> services}) = _$ServiceStateImpl;
  const _ServiceState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ServiceData> get allServices;
  @override
  List<ServiceData> get services;
  @override
  @JsonKey(ignore: true)
  _$$ServiceStateImplCopyWith<_$ServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
