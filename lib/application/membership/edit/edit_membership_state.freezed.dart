// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditMembershipState {
  List<ServiceData> get services => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  MembershipData? get membership => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMembershipStateCopyWith<EditMembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMembershipStateCopyWith<$Res> {
  factory $EditMembershipStateCopyWith(
          EditMembershipState value, $Res Function(EditMembershipState) then) =
      _$EditMembershipStateCopyWithImpl<$Res, EditMembershipState>;
  @useResult
  $Res call(
      {List<ServiceData> services, bool isLoading, MembershipData? membership});
}

/// @nodoc
class _$EditMembershipStateCopyWithImpl<$Res, $Val extends EditMembershipState>
    implements $EditMembershipStateCopyWith<$Res> {
  _$EditMembershipStateCopyWithImpl(this._value, this._then);

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
abstract class _$$EditMembershipStateImplCopyWith<$Res>
    implements $EditMembershipStateCopyWith<$Res> {
  factory _$$EditMembershipStateImplCopyWith(_$EditMembershipStateImpl value,
          $Res Function(_$EditMembershipStateImpl) then) =
      __$$EditMembershipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceData> services, bool isLoading, MembershipData? membership});
}

/// @nodoc
class __$$EditMembershipStateImplCopyWithImpl<$Res>
    extends _$EditMembershipStateCopyWithImpl<$Res, _$EditMembershipStateImpl>
    implements _$$EditMembershipStateImplCopyWith<$Res> {
  __$$EditMembershipStateImplCopyWithImpl(_$EditMembershipStateImpl _value,
      $Res Function(_$EditMembershipStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? isLoading = null,
    Object? membership = freezed,
  }) {
    return _then(_$EditMembershipStateImpl(
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

class _$EditMembershipStateImpl extends _EditMembershipState {
  const _$EditMembershipStateImpl(
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
    return 'EditMembershipState(services: $services, isLoading: $isLoading, membership: $membership)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMembershipStateImpl &&
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
  _$$EditMembershipStateImplCopyWith<_$EditMembershipStateImpl> get copyWith =>
      __$$EditMembershipStateImplCopyWithImpl<_$EditMembershipStateImpl>(
          this, _$identity);
}

abstract class _EditMembershipState extends EditMembershipState {
  const factory _EditMembershipState(
      {final List<ServiceData> services,
      final bool isLoading,
      final MembershipData? membership}) = _$EditMembershipStateImpl;
  const _EditMembershipState._() : super._();

  @override
  List<ServiceData> get services;
  @override
  bool get isLoading;
  @override
  MembershipData? get membership;
  @override
  @JsonKey(ignore: true)
  _$$EditMembershipStateImplCopyWith<_$EditMembershipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
