// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_master_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceMasterState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ServiceData> get services => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceMasterStateCopyWith<ServiceMasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceMasterStateCopyWith<$Res> {
  factory $ServiceMasterStateCopyWith(
          ServiceMasterState value, $Res Function(ServiceMasterState) then) =
      _$ServiceMasterStateCopyWithImpl<$Res, ServiceMasterState>;
  @useResult
  $Res call({bool isLoading, List<ServiceData> services});
}

/// @nodoc
class _$ServiceMasterStateCopyWithImpl<$Res, $Val extends ServiceMasterState>
    implements $ServiceMasterStateCopyWith<$Res> {
  _$ServiceMasterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceMasterStateImplCopyWith<$Res>
    implements $ServiceMasterStateCopyWith<$Res> {
  factory _$$ServiceMasterStateImplCopyWith(_$ServiceMasterStateImpl value,
          $Res Function(_$ServiceMasterStateImpl) then) =
      __$$ServiceMasterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ServiceData> services});
}

/// @nodoc
class __$$ServiceMasterStateImplCopyWithImpl<$Res>
    extends _$ServiceMasterStateCopyWithImpl<$Res, _$ServiceMasterStateImpl>
    implements _$$ServiceMasterStateImplCopyWith<$Res> {
  __$$ServiceMasterStateImplCopyWithImpl(_$ServiceMasterStateImpl _value,
      $Res Function(_$ServiceMasterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? services = null,
  }) {
    return _then(_$ServiceMasterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
    ));
  }
}

/// @nodoc

class _$ServiceMasterStateImpl extends _ServiceMasterState {
  const _$ServiceMasterStateImpl(
      {this.isLoading = false, final List<ServiceData> services = const []})
      : _services = services,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
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
    return 'ServiceMasterState(isLoading: $isLoading, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceMasterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceMasterStateImplCopyWith<_$ServiceMasterStateImpl> get copyWith =>
      __$$ServiceMasterStateImplCopyWithImpl<_$ServiceMasterStateImpl>(
          this, _$identity);
}

abstract class _ServiceMasterState extends ServiceMasterState {
  const factory _ServiceMasterState(
      {final bool isLoading,
      final List<ServiceData> services}) = _$ServiceMasterStateImpl;
  const _ServiceMasterState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ServiceData> get services;
  @override
  @JsonKey(ignore: true)
  _$$ServiceMasterStateImplCopyWith<_$ServiceMasterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
