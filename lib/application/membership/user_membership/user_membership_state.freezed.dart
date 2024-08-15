// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserMembershipState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserMembershipData> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserMembershipStateCopyWith<UserMembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMembershipStateCopyWith<$Res> {
  factory $UserMembershipStateCopyWith(
          UserMembershipState value, $Res Function(UserMembershipState) then) =
      _$UserMembershipStateCopyWithImpl<$Res, UserMembershipState>;
  @useResult
  $Res call({bool isLoading, List<UserMembershipData> list});
}

/// @nodoc
class _$UserMembershipStateCopyWithImpl<$Res, $Val extends UserMembershipState>
    implements $UserMembershipStateCopyWith<$Res> {
  _$UserMembershipStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserMembershipData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserMembershipStateImplCopyWith<$Res>
    implements $UserMembershipStateCopyWith<$Res> {
  factory _$$UserMembershipStateImplCopyWith(_$UserMembershipStateImpl value,
          $Res Function(_$UserMembershipStateImpl) then) =
      __$$UserMembershipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<UserMembershipData> list});
}

/// @nodoc
class __$$UserMembershipStateImplCopyWithImpl<$Res>
    extends _$UserMembershipStateCopyWithImpl<$Res, _$UserMembershipStateImpl>
    implements _$$UserMembershipStateImplCopyWith<$Res> {
  __$$UserMembershipStateImplCopyWithImpl(_$UserMembershipStateImpl _value,
      $Res Function(_$UserMembershipStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_$UserMembershipStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserMembershipData>,
    ));
  }
}

/// @nodoc

class _$UserMembershipStateImpl extends _UserMembershipState {
  const _$UserMembershipStateImpl(
      {this.isLoading = false, final List<UserMembershipData> list = const []})
      : _list = list,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<UserMembershipData> _list;
  @override
  @JsonKey()
  List<UserMembershipData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'UserMembershipState(isLoading: $isLoading, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserMembershipStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMembershipStateImplCopyWith<_$UserMembershipStateImpl> get copyWith =>
      __$$UserMembershipStateImplCopyWithImpl<_$UserMembershipStateImpl>(
          this, _$identity);
}

abstract class _UserMembershipState extends UserMembershipState {
  const factory _UserMembershipState(
      {final bool isLoading,
      final List<UserMembershipData> list}) = _$UserMembershipStateImpl;
  const _UserMembershipState._() : super._();

  @override
  bool get isLoading;
  @override
  List<UserMembershipData> get list;
  @override
  @JsonKey(ignore: true)
  _$$UserMembershipStateImplCopyWith<_$UserMembershipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
