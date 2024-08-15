// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_appbar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeAppbarState {
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeAppbarStateCopyWith<HomeAppbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAppbarStateCopyWith<$Res> {
  factory $HomeAppbarStateCopyWith(
          HomeAppbarState value, $Res Function(HomeAppbarState) then) =
      _$HomeAppbarStateCopyWithImpl<$Res, HomeAppbarState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$HomeAppbarStateCopyWithImpl<$Res, $Val extends HomeAppbarState>
    implements $HomeAppbarStateCopyWith<$Res> {
  _$HomeAppbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeAppbarStateImplCopyWith<$Res>
    implements $HomeAppbarStateCopyWith<$Res> {
  factory _$$HomeAppbarStateImplCopyWith(_$HomeAppbarStateImpl value,
          $Res Function(_$HomeAppbarStateImpl) then) =
      __$$HomeAppbarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$HomeAppbarStateImplCopyWithImpl<$Res>
    extends _$HomeAppbarStateCopyWithImpl<$Res, _$HomeAppbarStateImpl>
    implements _$$HomeAppbarStateImplCopyWith<$Res> {
  __$$HomeAppbarStateImplCopyWithImpl(
      _$HomeAppbarStateImpl _value, $Res Function(_$HomeAppbarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$HomeAppbarStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeAppbarStateImpl extends _HomeAppbarState {
  const _$HomeAppbarStateImpl({this.index = 0}) : super._();

  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'HomeAppbarState(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeAppbarStateImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeAppbarStateImplCopyWith<_$HomeAppbarStateImpl> get copyWith =>
      __$$HomeAppbarStateImplCopyWithImpl<_$HomeAppbarStateImpl>(
          this, _$identity);
}

abstract class _HomeAppbarState extends HomeAppbarState {
  const factory _HomeAppbarState({final int index}) = _$HomeAppbarStateImpl;
  const _HomeAppbarState._() : super._();

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$HomeAppbarStateImplCopyWith<_$HomeAppbarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
