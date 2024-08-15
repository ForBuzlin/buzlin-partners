// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_extras_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceExtrasState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ServiceExtrasData> get extras => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceExtrasStateCopyWith<ServiceExtrasState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceExtrasStateCopyWith<$Res> {
  factory $ServiceExtrasStateCopyWith(
          ServiceExtrasState value, $Res Function(ServiceExtrasState) then) =
      _$ServiceExtrasStateCopyWithImpl<$Res, ServiceExtrasState>;
  @useResult
  $Res call({bool isLoading, List<ServiceExtrasData> extras});
}

/// @nodoc
class _$ServiceExtrasStateCopyWithImpl<$Res, $Val extends ServiceExtrasState>
    implements $ServiceExtrasStateCopyWith<$Res> {
  _$ServiceExtrasStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? extras = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<ServiceExtrasData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceExtrasStateImplCopyWith<$Res>
    implements $ServiceExtrasStateCopyWith<$Res> {
  factory _$$ServiceExtrasStateImplCopyWith(_$ServiceExtrasStateImpl value,
          $Res Function(_$ServiceExtrasStateImpl) then) =
      __$$ServiceExtrasStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ServiceExtrasData> extras});
}

/// @nodoc
class __$$ServiceExtrasStateImplCopyWithImpl<$Res>
    extends _$ServiceExtrasStateCopyWithImpl<$Res, _$ServiceExtrasStateImpl>
    implements _$$ServiceExtrasStateImplCopyWith<$Res> {
  __$$ServiceExtrasStateImplCopyWithImpl(_$ServiceExtrasStateImpl _value,
      $Res Function(_$ServiceExtrasStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? extras = null,
  }) {
    return _then(_$ServiceExtrasStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: null == extras
          ? _value._extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<ServiceExtrasData>,
    ));
  }
}

/// @nodoc

class _$ServiceExtrasStateImpl extends _ServiceExtrasState {
  const _$ServiceExtrasStateImpl(
      {this.isLoading = false, final List<ServiceExtrasData> extras = const []})
      : _extras = extras,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ServiceExtrasData> _extras;
  @override
  @JsonKey()
  List<ServiceExtrasData> get extras {
    if (_extras is EqualUnmodifiableListView) return _extras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extras);
  }

  @override
  String toString() {
    return 'ServiceExtrasState(isLoading: $isLoading, extras: $extras)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceExtrasStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._extras, _extras));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_extras));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceExtrasStateImplCopyWith<_$ServiceExtrasStateImpl> get copyWith =>
      __$$ServiceExtrasStateImplCopyWithImpl<_$ServiceExtrasStateImpl>(
          this, _$identity);
}

abstract class _ServiceExtrasState extends ServiceExtrasState {
  const factory _ServiceExtrasState(
      {final bool isLoading,
      final List<ServiceExtrasData> extras}) = _$ServiceExtrasStateImpl;
  const _ServiceExtrasState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ServiceExtrasData> get extras;
  @override
  @JsonKey(ignore: true)
  _$$ServiceExtrasStateImplCopyWith<_$ServiceExtrasStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
