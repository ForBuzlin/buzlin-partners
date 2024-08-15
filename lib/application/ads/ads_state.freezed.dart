// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<AdsData> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdsStateCopyWith<AdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsStateCopyWith<$Res> {
  factory $AdsStateCopyWith(AdsState value, $Res Function(AdsState) then) =
      _$AdsStateCopyWithImpl<$Res, AdsState>;
  @useResult
  $Res call({bool isLoading, List<AdsData> list});
}

/// @nodoc
class _$AdsStateCopyWithImpl<$Res, $Val extends AdsState>
    implements $AdsStateCopyWith<$Res> {
  _$AdsStateCopyWithImpl(this._value, this._then);

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
              as List<AdsData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsStateImplCopyWith<$Res>
    implements $AdsStateCopyWith<$Res> {
  factory _$$AdsStateImplCopyWith(
          _$AdsStateImpl value, $Res Function(_$AdsStateImpl) then) =
      __$$AdsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<AdsData> list});
}

/// @nodoc
class __$$AdsStateImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$AdsStateImpl>
    implements _$$AdsStateImplCopyWith<$Res> {
  __$$AdsStateImplCopyWithImpl(
      _$AdsStateImpl _value, $Res Function(_$AdsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_$AdsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<AdsData>,
    ));
  }
}

/// @nodoc

class _$AdsStateImpl extends _AdsState {
  const _$AdsStateImpl(
      {this.isLoading = false, final List<AdsData> list = const []})
      : _list = list,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<AdsData> _list;
  @override
  @JsonKey()
  List<AdsData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'AdsState(isLoading: $isLoading, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsStateImpl &&
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
  _$$AdsStateImplCopyWith<_$AdsStateImpl> get copyWith =>
      __$$AdsStateImplCopyWithImpl<_$AdsStateImpl>(this, _$identity);
}

abstract class _AdsState extends AdsState {
  const factory _AdsState({final bool isLoading, final List<AdsData> list}) =
      _$AdsStateImpl;
  const _AdsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<AdsData> get list;
  @override
  @JsonKey(ignore: true)
  _$$AdsStateImplCopyWith<_$AdsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
