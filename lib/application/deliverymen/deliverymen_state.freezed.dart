// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deliverymen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliverymenState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;
  List<UserData> get users => throw _privateConstructorUsedError;
  int get statusIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliverymenStateCopyWith<DeliverymenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliverymenStateCopyWith<$Res> {
  factory $DeliverymenStateCopyWith(
          DeliverymenState value, $Res Function(DeliverymenState) then) =
      _$DeliverymenStateCopyWithImpl<$Res, DeliverymenState>;
  @useResult
  $Res call(
      {bool isLoading, bool isUpdate, List<UserData> users, int statusIndex});
}

/// @nodoc
class _$DeliverymenStateCopyWithImpl<$Res, $Val extends DeliverymenState>
    implements $DeliverymenStateCopyWith<$Res> {
  _$DeliverymenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdate = null,
    Object? users = null,
    Object? statusIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      statusIndex: null == statusIndex
          ? _value.statusIndex
          : statusIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliverymenStateImplCopyWith<$Res>
    implements $DeliverymenStateCopyWith<$Res> {
  factory _$$DeliverymenStateImplCopyWith(_$DeliverymenStateImpl value,
          $Res Function(_$DeliverymenStateImpl) then) =
      __$$DeliverymenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isUpdate, List<UserData> users, int statusIndex});
}

/// @nodoc
class __$$DeliverymenStateImplCopyWithImpl<$Res>
    extends _$DeliverymenStateCopyWithImpl<$Res, _$DeliverymenStateImpl>
    implements _$$DeliverymenStateImplCopyWith<$Res> {
  __$$DeliverymenStateImplCopyWithImpl(_$DeliverymenStateImpl _value,
      $Res Function(_$DeliverymenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdate = null,
    Object? users = null,
    Object? statusIndex = null,
  }) {
    return _then(_$DeliverymenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      statusIndex: null == statusIndex
          ? _value.statusIndex
          : statusIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeliverymenStateImpl extends _DeliverymenState {
  const _$DeliverymenStateImpl(
      {this.isLoading = false,
      this.isUpdate = false,
      final List<UserData> users = const [],
      this.statusIndex = -1})
      : _users = users,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdate;
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
  final int statusIndex;

  @override
  String toString() {
    return 'DeliverymenState(isLoading: $isLoading, isUpdate: $isUpdate, users: $users, statusIndex: $statusIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliverymenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.statusIndex, statusIndex) ||
                other.statusIndex == statusIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isUpdate,
      const DeepCollectionEquality().hash(_users), statusIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliverymenStateImplCopyWith<_$DeliverymenStateImpl> get copyWith =>
      __$$DeliverymenStateImplCopyWithImpl<_$DeliverymenStateImpl>(
          this, _$identity);
}

abstract class _DeliverymenState extends DeliverymenState {
  const factory _DeliverymenState(
      {final bool isLoading,
      final bool isUpdate,
      final List<UserData> users,
      final int statusIndex}) = _$DeliverymenStateImpl;
  const _DeliverymenState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdate;
  @override
  List<UserData> get users;
  @override
  int get statusIndex;
  @override
  @JsonKey(ignore: true)
  _$$DeliverymenStateImplCopyWith<_$DeliverymenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
