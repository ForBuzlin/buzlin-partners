// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rejected_masters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RejectedMastersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserData> get users => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RejectedMastersStateCopyWith<RejectedMastersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectedMastersStateCopyWith<$Res> {
  factory $RejectedMastersStateCopyWith(RejectedMastersState value,
          $Res Function(RejectedMastersState) then) =
      _$RejectedMastersStateCopyWithImpl<$Res, RejectedMastersState>;
  @useResult
  $Res call({bool isLoading, List<UserData> users, int totalCount});
}

/// @nodoc
class _$RejectedMastersStateCopyWithImpl<$Res,
        $Val extends RejectedMastersState>
    implements $RejectedMastersStateCopyWith<$Res> {
  _$RejectedMastersStateCopyWithImpl(this._value, this._then);

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
abstract class _$$RejectedMastersStateImplCopyWith<$Res>
    implements $RejectedMastersStateCopyWith<$Res> {
  factory _$$RejectedMastersStateImplCopyWith(_$RejectedMastersStateImpl value,
          $Res Function(_$RejectedMastersStateImpl) then) =
      __$$RejectedMastersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<UserData> users, int totalCount});
}

/// @nodoc
class __$$RejectedMastersStateImplCopyWithImpl<$Res>
    extends _$RejectedMastersStateCopyWithImpl<$Res, _$RejectedMastersStateImpl>
    implements _$$RejectedMastersStateImplCopyWith<$Res> {
  __$$RejectedMastersStateImplCopyWithImpl(_$RejectedMastersStateImpl _value,
      $Res Function(_$RejectedMastersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
    Object? totalCount = null,
  }) {
    return _then(_$RejectedMastersStateImpl(
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

class _$RejectedMastersStateImpl extends _RejectedMastersState {
  const _$RejectedMastersStateImpl(
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
    return 'RejectedMastersState(isLoading: $isLoading, users: $users, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectedMastersStateImpl &&
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
  _$$RejectedMastersStateImplCopyWith<_$RejectedMastersStateImpl>
      get copyWith =>
          __$$RejectedMastersStateImplCopyWithImpl<_$RejectedMastersStateImpl>(
              this, _$identity);
}

abstract class _RejectedMastersState extends RejectedMastersState {
  const factory _RejectedMastersState(
      {final bool isLoading,
      final List<UserData> users,
      final int totalCount}) = _$RejectedMastersStateImpl;
  const _RejectedMastersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<UserData> get users;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$RejectedMastersStateImplCopyWith<_$RejectedMastersStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
