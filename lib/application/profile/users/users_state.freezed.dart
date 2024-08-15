// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsersState {
  String? get imageFile => throw _privateConstructorUsedError;
  TextEditingController? get birthday => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  GetProfileInfoResponse? get getProfileInfoResponse =>
      throw _privateConstructorUsedError;
  List<UserData> get users => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  UserData? get selectedUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersStateCopyWith<UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) then) =
      _$UsersStateCopyWithImpl<$Res, UsersState>;
  @useResult
  $Res call(
      {String? imageFile,
      TextEditingController? birthday,
      String? gender,
      GetProfileInfoResponse? getProfileInfoResponse,
      List<UserData> users,
      bool isLoading,
      UserData? selectedUser});
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? getProfileInfoResponse = freezed,
    Object? users = null,
    Object? isLoading = null,
    Object? selectedUser = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      getProfileInfoResponse: freezed == getProfileInfoResponse
          ? _value.getProfileInfoResponse
          : getProfileInfoResponse // ignore: cast_nullable_to_non_nullable
              as GetProfileInfoResponse?,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersStateImplCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory _$$UsersStateImplCopyWith(
          _$UsersStateImpl value, $Res Function(_$UsersStateImpl) then) =
      __$$UsersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? imageFile,
      TextEditingController? birthday,
      String? gender,
      GetProfileInfoResponse? getProfileInfoResponse,
      List<UserData> users,
      bool isLoading,
      UserData? selectedUser});
}

/// @nodoc
class __$$UsersStateImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersStateImpl>
    implements _$$UsersStateImplCopyWith<$Res> {
  __$$UsersStateImplCopyWithImpl(
      _$UsersStateImpl _value, $Res Function(_$UsersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? getProfileInfoResponse = freezed,
    Object? users = null,
    Object? isLoading = null,
    Object? selectedUser = freezed,
  }) {
    return _then(_$UsersStateImpl(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      getProfileInfoResponse: freezed == getProfileInfoResponse
          ? _value.getProfileInfoResponse
          : getProfileInfoResponse // ignore: cast_nullable_to_non_nullable
              as GetProfileInfoResponse?,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUser: freezed == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$UsersStateImpl extends _UsersState {
  const _$UsersStateImpl(
      {this.imageFile,
      this.birthday,
      this.gender,
      this.getProfileInfoResponse,
      final List<UserData> users = const [],
      this.isLoading = false,
      this.selectedUser})
      : _users = users,
        super._();

  @override
  final String? imageFile;
  @override
  final TextEditingController? birthday;
  @override
  final String? gender;
  @override
  final GetProfileInfoResponse? getProfileInfoResponse;
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
  final bool isLoading;
  @override
  final UserData? selectedUser;

  @override
  String toString() {
    return 'UsersState(imageFile: $imageFile, birthday: $birthday, gender: $gender, getProfileInfoResponse: $getProfileInfoResponse, users: $users, isLoading: $isLoading, selectedUser: $selectedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersStateImpl &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.getProfileInfoResponse, getProfileInfoResponse) ||
                other.getProfileInfoResponse == getProfileInfoResponse) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageFile,
      birthday,
      gender,
      getProfileInfoResponse,
      const DeepCollectionEquality().hash(_users),
      isLoading,
      selectedUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersStateImplCopyWith<_$UsersStateImpl> get copyWith =>
      __$$UsersStateImplCopyWithImpl<_$UsersStateImpl>(this, _$identity);
}

abstract class _UsersState extends UsersState {
  const factory _UsersState(
      {final String? imageFile,
      final TextEditingController? birthday,
      final String? gender,
      final GetProfileInfoResponse? getProfileInfoResponse,
      final List<UserData> users,
      final bool isLoading,
      final UserData? selectedUser}) = _$UsersStateImpl;
  const _UsersState._() : super._();

  @override
  String? get imageFile;
  @override
  TextEditingController? get birthday;
  @override
  String? get gender;
  @override
  GetProfileInfoResponse? get getProfileInfoResponse;
  @override
  List<UserData> get users;
  @override
  bool get isLoading;
  @override
  UserData? get selectedUser;
  @override
  @JsonKey(ignore: true)
  _$$UsersStateImplCopyWith<_$UsersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
