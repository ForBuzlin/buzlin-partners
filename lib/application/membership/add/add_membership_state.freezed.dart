// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddMembershipState {
  List<ServiceData> get services => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  MembershipData? get membership => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddMembershipStateCopyWith<AddMembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMembershipStateCopyWith<$Res> {
  factory $AddMembershipStateCopyWith(
          AddMembershipState value, $Res Function(AddMembershipState) then) =
      _$AddMembershipStateCopyWithImpl<$Res, AddMembershipState>;
  @useResult
  $Res call(
      {List<ServiceData> services, bool isLoading, MembershipData? membership});
}

/// @nodoc
class _$AddMembershipStateCopyWithImpl<$Res, $Val extends AddMembershipState>
    implements $AddMembershipStateCopyWith<$Res> {
  _$AddMembershipStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? isLoading = null,
    Object? membership = freezed,
  }) {
    return _then(_value.copyWith(
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      membership: freezed == membership
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as MembershipData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddMembershipStateImplCopyWith<$Res>
    implements $AddMembershipStateCopyWith<$Res> {
  factory _$$AddMembershipStateImplCopyWith(_$AddMembershipStateImpl value,
          $Res Function(_$AddMembershipStateImpl) then) =
      __$$AddMembershipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceData> services, bool isLoading, MembershipData? membership});
}

/// @nodoc
class __$$AddMembershipStateImplCopyWithImpl<$Res>
    extends _$AddMembershipStateCopyWithImpl<$Res, _$AddMembershipStateImpl>
    implements _$$AddMembershipStateImplCopyWith<$Res> {
  __$$AddMembershipStateImplCopyWithImpl(_$AddMembershipStateImpl _value,
      $Res Function(_$AddMembershipStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? isLoading = null,
    Object? membership = freezed,
  }) {
    return _then(_$AddMembershipStateImpl(
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      membership: freezed == membership
          ? _value.membership
          : membership // ignore: cast_nullable_to_non_nullable
              as MembershipData?,
    ));
  }
}

/// @nodoc

class _$AddMembershipStateImpl extends _AddMembershipState {
  const _$AddMembershipStateImpl(
      {final List<ServiceData> services = const [],
      this.isLoading = false,
      this.membership})
      : _services = services,
        super._();

  final List<ServiceData> _services;
  @override
  @JsonKey()
  List<ServiceData> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final MembershipData? membership;

  @override
  String toString() {
    return 'AddMembershipState(services: $services, isLoading: $isLoading, membership: $membership)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMembershipStateImpl &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.membership, membership) ||
                other.membership == membership));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_services), isLoading, membership);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMembershipStateImplCopyWith<_$AddMembershipStateImpl> get copyWith =>
      __$$AddMembershipStateImplCopyWithImpl<_$AddMembershipStateImpl>(
          this, _$identity);
}

abstract class _AddMembershipState extends AddMembershipState {
  const factory _AddMembershipState(
      {final List<ServiceData> services,
      final bool isLoading,
      final MembershipData? membership}) = _$AddMembershipStateImpl;
  const _AddMembershipState._() : super._();

  @override
  List<ServiceData> get services;
  @override
  bool get isLoading;
  @override
  MembershipData? get membership;
  @override
  @JsonKey(ignore: true)
  _$$AddMembershipStateImplCopyWith<_$AddMembershipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
