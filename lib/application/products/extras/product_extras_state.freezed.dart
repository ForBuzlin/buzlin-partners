// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_extras_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductExtrasState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<Group> get groups => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductExtrasStateCopyWith<ProductExtrasState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductExtrasStateCopyWith<$Res> {
  factory $ProductExtrasStateCopyWith(
          ProductExtrasState value, $Res Function(ProductExtrasState) then) =
      _$ProductExtrasStateCopyWithImpl<$Res, ProductExtrasState>;
  @useResult
  $Res call({bool isLoading, bool isSaving, List<Group> groups});
}

/// @nodoc
class _$ProductExtrasStateCopyWithImpl<$Res, $Val extends ProductExtrasState>
    implements $ProductExtrasStateCopyWith<$Res> {
  _$ProductExtrasStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? groups = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductExtrasStateImplCopyWith<$Res>
    implements $ProductExtrasStateCopyWith<$Res> {
  factory _$$ProductExtrasStateImplCopyWith(_$ProductExtrasStateImpl value,
          $Res Function(_$ProductExtrasStateImpl) then) =
      __$$ProductExtrasStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isSaving, List<Group> groups});
}

/// @nodoc
class __$$ProductExtrasStateImplCopyWithImpl<$Res>
    extends _$ProductExtrasStateCopyWithImpl<$Res, _$ProductExtrasStateImpl>
    implements _$$ProductExtrasStateImplCopyWith<$Res> {
  __$$ProductExtrasStateImplCopyWithImpl(_$ProductExtrasStateImpl _value,
      $Res Function(_$ProductExtrasStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? groups = null,
  }) {
    return _then(_$ProductExtrasStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
    ));
  }
}

/// @nodoc

class _$ProductExtrasStateImpl extends _ProductExtrasState {
  const _$ProductExtrasStateImpl(
      {this.isLoading = false,
      this.isSaving = false,
      final List<Group> groups = const []})
      : _groups = groups,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<Group> _groups;
  @override
  @JsonKey()
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  String toString() {
    return 'ProductExtrasState(isLoading: $isLoading, isSaving: $isSaving, groups: $groups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductExtrasStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSaving,
      const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductExtrasStateImplCopyWith<_$ProductExtrasStateImpl> get copyWith =>
      __$$ProductExtrasStateImplCopyWithImpl<_$ProductExtrasStateImpl>(
          this, _$identity);
}

abstract class _ProductExtrasState extends ProductExtrasState {
  const factory _ProductExtrasState(
      {final bool isLoading,
      final bool isSaving,
      final List<Group> groups}) = _$ProductExtrasStateImpl;
  const _ProductExtrasState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<Group> get groups;
  @override
  @JsonKey(ignore: true)
  _$$ProductExtrasStateImplCopyWith<_$ProductExtrasStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
