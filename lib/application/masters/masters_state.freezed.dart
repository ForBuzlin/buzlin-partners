// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'masters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MastersState {
  int get index => throw _privateConstructorUsedError;
  int get statusIndex => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastersStateCopyWith<MastersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastersStateCopyWith<$Res> {
  factory $MastersStateCopyWith(
          MastersState value, $Res Function(MastersState) then) =
      _$MastersStateCopyWithImpl<$Res, MastersState>;
  @useResult
  $Res call({int index, int statusIndex, bool isUpdate});
}

/// @nodoc
class _$MastersStateCopyWithImpl<$Res, $Val extends MastersState>
    implements $MastersStateCopyWith<$Res> {
  _$MastersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? statusIndex = null,
    Object? isUpdate = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      statusIndex: null == statusIndex
          ? _value.statusIndex
          : statusIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MastersStateImplCopyWith<$Res>
    implements $MastersStateCopyWith<$Res> {
  factory _$$MastersStateImplCopyWith(
          _$MastersStateImpl value, $Res Function(_$MastersStateImpl) then) =
      __$$MastersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, int statusIndex, bool isUpdate});
}

/// @nodoc
class __$$MastersStateImplCopyWithImpl<$Res>
    extends _$MastersStateCopyWithImpl<$Res, _$MastersStateImpl>
    implements _$$MastersStateImplCopyWith<$Res> {
  __$$MastersStateImplCopyWithImpl(
      _$MastersStateImpl _value, $Res Function(_$MastersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? statusIndex = null,
    Object? isUpdate = null,
  }) {
    return _then(_$MastersStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      statusIndex: null == statusIndex
          ? _value.statusIndex
          : statusIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MastersStateImpl extends _MastersState {
  const _$MastersStateImpl(
      {this.index = 0, this.statusIndex = -1, this.isUpdate = false})
      : super._();

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int statusIndex;
  @override
  @JsonKey()
  final bool isUpdate;

  @override
  String toString() {
    return 'MastersState(index: $index, statusIndex: $statusIndex, isUpdate: $isUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MastersStateImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.statusIndex, statusIndex) ||
                other.statusIndex == statusIndex) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, statusIndex, isUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MastersStateImplCopyWith<_$MastersStateImpl> get copyWith =>
      __$$MastersStateImplCopyWithImpl<_$MastersStateImpl>(this, _$identity);
}

abstract class _MastersState extends MastersState {
  const factory _MastersState(
      {final int index,
      final int statusIndex,
      final bool isUpdate}) = _$MastersStateImpl;
  const _MastersState._() : super._();

  @override
  int get index;
  @override
  int get statusIndex;
  @override
  bool get isUpdate;
  @override
  @JsonKey(ignore: true)
  _$$MastersStateImplCopyWith<_$MastersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
