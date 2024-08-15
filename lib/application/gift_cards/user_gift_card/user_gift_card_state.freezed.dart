// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_gift_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserGiftCardState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserGiftCardData> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserGiftCardStateCopyWith<UserGiftCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGiftCardStateCopyWith<$Res> {
  factory $UserGiftCardStateCopyWith(
          UserGiftCardState value, $Res Function(UserGiftCardState) then) =
      _$UserGiftCardStateCopyWithImpl<$Res, UserGiftCardState>;
  @useResult
  $Res call({bool isLoading, List<UserGiftCardData> list});
}

/// @nodoc
class _$UserGiftCardStateCopyWithImpl<$Res, $Val extends UserGiftCardState>
    implements $UserGiftCardStateCopyWith<$Res> {
  _$UserGiftCardStateCopyWithImpl(this._value, this._then);

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
              as List<UserGiftCardData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserGiftCardStateImplCopyWith<$Res>
    implements $UserGiftCardStateCopyWith<$Res> {
  factory _$$UserGiftCardStateImplCopyWith(_$UserGiftCardStateImpl value,
          $Res Function(_$UserGiftCardStateImpl) then) =
      __$$UserGiftCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<UserGiftCardData> list});
}

/// @nodoc
class __$$UserGiftCardStateImplCopyWithImpl<$Res>
    extends _$UserGiftCardStateCopyWithImpl<$Res, _$UserGiftCardStateImpl>
    implements _$$UserGiftCardStateImplCopyWith<$Res> {
  __$$UserGiftCardStateImplCopyWithImpl(_$UserGiftCardStateImpl _value,
      $Res Function(_$UserGiftCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_$UserGiftCardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserGiftCardData>,
    ));
  }
}

/// @nodoc

class _$UserGiftCardStateImpl extends _UserGiftCardState {
  const _$UserGiftCardStateImpl(
      {this.isLoading = false, final List<UserGiftCardData> list = const []})
      : _list = list,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<UserGiftCardData> _list;
  @override
  @JsonKey()
  List<UserGiftCardData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'UserGiftCardState(isLoading: $isLoading, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGiftCardStateImpl &&
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
  _$$UserGiftCardStateImplCopyWith<_$UserGiftCardStateImpl> get copyWith =>
      __$$UserGiftCardStateImplCopyWithImpl<_$UserGiftCardStateImpl>(
          this, _$identity);
}

abstract class _UserGiftCardState extends UserGiftCardState {
  const factory _UserGiftCardState(
      {final bool isLoading,
      final List<UserGiftCardData> list}) = _$UserGiftCardStateImpl;
  const _UserGiftCardState._() : super._();

  @override
  bool get isLoading;
  @override
  List<UserGiftCardData> get list;
  @override
  @JsonKey(ignore: true)
  _$$UserGiftCardStateImplCopyWith<_$UserGiftCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
