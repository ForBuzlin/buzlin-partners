// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_masters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingMastersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserData> get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingMastersStateCopyWith<BookingMastersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingMastersStateCopyWith<$Res> {
  factory $BookingMastersStateCopyWith(
          BookingMastersState value, $Res Function(BookingMastersState) then) =
      _$BookingMastersStateCopyWithImpl<$Res, BookingMastersState>;
  @useResult
  $Res call({bool isLoading, List<UserData> users});
}

/// @nodoc
class _$BookingMastersStateCopyWithImpl<$Res, $Val extends BookingMastersState>
    implements $BookingMastersStateCopyWith<$Res> {
  _$BookingMastersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingMastersStateImplCopyWith<$Res>
    implements $BookingMastersStateCopyWith<$Res> {
  factory _$$BookingMastersStateImplCopyWith(_$BookingMastersStateImpl value,
          $Res Function(_$BookingMastersStateImpl) then) =
      __$$BookingMastersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<UserData> users});
}

/// @nodoc
class __$$BookingMastersStateImplCopyWithImpl<$Res>
    extends _$BookingMastersStateCopyWithImpl<$Res, _$BookingMastersStateImpl>
    implements _$$BookingMastersStateImplCopyWith<$Res> {
  __$$BookingMastersStateImplCopyWithImpl(_$BookingMastersStateImpl _value,
      $Res Function(_$BookingMastersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = null,
  }) {
    return _then(_$BookingMastersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
    ));
  }
}

/// @nodoc

class _$BookingMastersStateImpl extends _BookingMastersState {
  const _$BookingMastersStateImpl(
      {this.isLoading = false, final List<UserData> users = const []})
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
  String toString() {
    return 'BookingMastersState(isLoading: $isLoading, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingMastersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingMastersStateImplCopyWith<_$BookingMastersStateImpl> get copyWith =>
      __$$BookingMastersStateImplCopyWithImpl<_$BookingMastersStateImpl>(
          this, _$identity);
}

abstract class _BookingMastersState extends BookingMastersState {
  const factory _BookingMastersState(
      {final bool isLoading,
      final List<UserData> users}) = _$BookingMastersStateImpl;
  const _BookingMastersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<UserData> get users;
  @override
  @JsonKey(ignore: true)
  _$$BookingMastersStateImplCopyWith<_$BookingMastersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
