// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'looks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LooksState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<LooksData> get looks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LooksStateCopyWith<LooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LooksStateCopyWith<$Res> {
  factory $LooksStateCopyWith(
          LooksState value, $Res Function(LooksState) then) =
      _$LooksStateCopyWithImpl<$Res, LooksState>;
  @useResult
  $Res call({bool isLoading, List<LooksData> looks});
}

/// @nodoc
class _$LooksStateCopyWithImpl<$Res, $Val extends LooksState>
    implements $LooksStateCopyWith<$Res> {
  _$LooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? looks = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      looks: null == looks
          ? _value.looks
          : looks // ignore: cast_nullable_to_non_nullable
              as List<LooksData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LooksStateImplCopyWith<$Res>
    implements $LooksStateCopyWith<$Res> {
  factory _$$LooksStateImplCopyWith(
          _$LooksStateImpl value, $Res Function(_$LooksStateImpl) then) =
      __$$LooksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<LooksData> looks});
}

/// @nodoc
class __$$LooksStateImplCopyWithImpl<$Res>
    extends _$LooksStateCopyWithImpl<$Res, _$LooksStateImpl>
    implements _$$LooksStateImplCopyWith<$Res> {
  __$$LooksStateImplCopyWithImpl(
      _$LooksStateImpl _value, $Res Function(_$LooksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? looks = null,
  }) {
    return _then(_$LooksStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      looks: null == looks
          ? _value._looks
          : looks // ignore: cast_nullable_to_non_nullable
              as List<LooksData>,
    ));
  }
}

/// @nodoc

class _$LooksStateImpl extends _LooksState {
  const _$LooksStateImpl(
      {this.isLoading = false, final List<LooksData> looks = const []})
      : _looks = looks,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<LooksData> _looks;
  @override
  @JsonKey()
  List<LooksData> get looks {
    if (_looks is EqualUnmodifiableListView) return _looks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_looks);
  }

  @override
  String toString() {
    return 'LooksState(isLoading: $isLoading, looks: $looks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LooksStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._looks, _looks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_looks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LooksStateImplCopyWith<_$LooksStateImpl> get copyWith =>
      __$$LooksStateImplCopyWithImpl<_$LooksStateImpl>(this, _$identity);
}

abstract class _LooksState extends LooksState {
  const factory _LooksState(
      {final bool isLoading, final List<LooksData> looks}) = _$LooksStateImpl;
  const _LooksState._() : super._();

  @override
  bool get isLoading;
  @override
  List<LooksData> get looks;
  @override
  @JsonKey(ignore: true)
  _$$LooksStateImplCopyWith<_$LooksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
