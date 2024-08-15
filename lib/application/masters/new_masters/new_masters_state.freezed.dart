// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_masters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewMastersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserData> get users => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewMastersStateCopyWith<NewMastersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMastersStateCopyWith<$Res> {
  factory $NewMastersStateCopyWith(
          NewMastersState value, $Res Function(NewMastersState) then) =
      _$NewMastersStateCopyWithImpl<$Res, NewMastersState>;
  @useResult
  $Res call({bool isLoading, List<UserData> users, int totalCount});
}

/// @nodoc
class _$NewMastersStateCopyWithImpl<$Res, $Val extends NewMastersState>
    implements $NewMastersStateCopyWith<$Res> {
  _$NewMastersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewMastersStateImplCopyWith<$Res>
    implements $NewMastersStateCopyWith<$Res> {
  factory _$$NewMastersStateImplCopyWith(_$NewMastersStateImpl value,
          $Res Function(_$NewMastersStateImpl) then) =
      __$$NewMastersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<UserData> users, int totalCount});
}

/// @nodoc
class __$$NewMastersStateImplCopyWithImpl<$Res>
    extends _$NewMastersStateCopyWithImpl<$Res, _$NewMastersStateImpl>
    implements _$$NewMastersStateImplCopyWith<$Res> {
  __$$NewMastersStateImplCopyWithImpl(
      _$NewMastersStateImpl _value, $Res Function(_$NewMastersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
    Object? totalCount = null,
  }) {
    return _then(_$NewMastersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewMastersStateImpl extends _NewMastersState {
  const _$NewMastersStateImpl(
      {this.isLoading = false,
      final List<UserData> users = const [],
      this.totalCount = 0})
      : _users = users,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<UserData> _users;
  @override
  @JsonKey()
  List<UserData> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'NewMastersState(isLoading: $isLoading, users: $users, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewMastersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_users), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewMastersStateImplCopyWith<_$NewMastersStateImpl> get copyWith =>
      __$$NewMastersStateImplCopyWithImpl<_$NewMastersStateImpl>(
          this, _$identity);
}

abstract class _NewMastersState extends NewMastersState {
  const factory _NewMastersState(
      {final bool isLoading,
      final List<UserData> users,
      final int totalCount}) = _$NewMastersStateImpl;
  const _NewMastersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<UserData> get users;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$NewMastersStateImplCopyWith<_$NewMastersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
