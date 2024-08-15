// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GiftCardState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<GiftCardData> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GiftCardStateCopyWith<GiftCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardStateCopyWith<$Res> {
  factory $GiftCardStateCopyWith(
          GiftCardState value, $Res Function(GiftCardState) then) =
      _$GiftCardStateCopyWithImpl<$Res, GiftCardState>;
  @useResult
  $Res call({bool isLoading, List<GiftCardData> list});
}

/// @nodoc
class _$GiftCardStateCopyWithImpl<$Res, $Val extends GiftCardState>
    implements $GiftCardStateCopyWith<$Res> {
  _$GiftCardStateCopyWithImpl(this._value, this._then);

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
              as List<GiftCardData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftCardStateImplCopyWith<$Res>
    implements $GiftCardStateCopyWith<$Res> {
  factory _$$GiftCardStateImplCopyWith(
          _$GiftCardStateImpl value, $Res Function(_$GiftCardStateImpl) then) =
      __$$GiftCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<GiftCardData> list});
}

/// @nodoc
class __$$GiftCardStateImplCopyWithImpl<$Res>
    extends _$GiftCardStateCopyWithImpl<$Res, _$GiftCardStateImpl>
    implements _$$GiftCardStateImplCopyWith<$Res> {
  __$$GiftCardStateImplCopyWithImpl(
      _$GiftCardStateImpl _value, $Res Function(_$GiftCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_$GiftCardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<GiftCardData>,
    ));
  }
}

/// @nodoc

class _$GiftCardStateImpl extends _GiftCardState {
  const _$GiftCardStateImpl(
      {this.isLoading = false, final List<GiftCardData> list = const []})
      : _list = list,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<GiftCardData> _list;
  @override
  @JsonKey()
  List<GiftCardData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'GiftCardState(isLoading: $isLoading, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardStateImpl &&
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
  _$$GiftCardStateImplCopyWith<_$GiftCardStateImpl> get copyWith =>
      __$$GiftCardStateImplCopyWithImpl<_$GiftCardStateImpl>(this, _$identity);
}

abstract class _GiftCardState extends GiftCardState {
  const factory _GiftCardState(
      {final bool isLoading,
      final List<GiftCardData> list}) = _$GiftCardStateImpl;
  const _GiftCardState._() : super._();

  @override
  bool get isLoading;
  @override
  List<GiftCardData> get list;
  @override
  @JsonKey(ignore: true)
  _$$GiftCardStateImplCopyWith<_$GiftCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
