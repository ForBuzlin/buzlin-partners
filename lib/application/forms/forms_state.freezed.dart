// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forms_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormOptionState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isParentLoading => throw _privateConstructorUsedError;
  List<FormOptionsData> get list => throw _privateConstructorUsedError;
  List<FormOptionsData> get parentForms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormOptionStateCopyWith<FormOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormOptionStateCopyWith<$Res> {
  factory $FormOptionStateCopyWith(
          FormOptionState value, $Res Function(FormOptionState) then) =
      _$FormOptionStateCopyWithImpl<$Res, FormOptionState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isParentLoading,
      List<FormOptionsData> list,
      List<FormOptionsData> parentForms});
}

/// @nodoc
class _$FormOptionStateCopyWithImpl<$Res, $Val extends FormOptionState>
    implements $FormOptionStateCopyWith<$Res> {
  _$FormOptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isParentLoading = null,
    Object? list = null,
    Object? parentForms = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isParentLoading: null == isParentLoading
          ? _value.isParentLoading
          : isParentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<FormOptionsData>,
      parentForms: null == parentForms
          ? _value.parentForms
          : parentForms // ignore: cast_nullable_to_non_nullable
              as List<FormOptionsData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormOptionStateImplCopyWith<$Res>
    implements $FormOptionStateCopyWith<$Res> {
  factory _$$FormOptionStateImplCopyWith(_$FormOptionStateImpl value,
          $Res Function(_$FormOptionStateImpl) then) =
      __$$FormOptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isParentLoading,
      List<FormOptionsData> list,
      List<FormOptionsData> parentForms});
}

/// @nodoc
class __$$FormOptionStateImplCopyWithImpl<$Res>
    extends _$FormOptionStateCopyWithImpl<$Res, _$FormOptionStateImpl>
    implements _$$FormOptionStateImplCopyWith<$Res> {
  __$$FormOptionStateImplCopyWithImpl(
      _$FormOptionStateImpl _value, $Res Function(_$FormOptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isParentLoading = null,
    Object? list = null,
    Object? parentForms = null,
  }) {
    return _then(_$FormOptionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isParentLoading: null == isParentLoading
          ? _value.isParentLoading
          : isParentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<FormOptionsData>,
      parentForms: null == parentForms
          ? _value._parentForms
          : parentForms // ignore: cast_nullable_to_non_nullable
              as List<FormOptionsData>,
    ));
  }
}

/// @nodoc

class _$FormOptionStateImpl extends _FormOptionState {
  const _$FormOptionStateImpl(
      {this.isLoading = false,
      this.isParentLoading = false,
      final List<FormOptionsData> list = const [],
      final List<FormOptionsData> parentForms = const []})
      : _list = list,
        _parentForms = parentForms,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isParentLoading;
  final List<FormOptionsData> _list;
  @override
  @JsonKey()
  List<FormOptionsData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  final List<FormOptionsData> _parentForms;
  @override
  @JsonKey()
  List<FormOptionsData> get parentForms {
    if (_parentForms is EqualUnmodifiableListView) return _parentForms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parentForms);
  }

  @override
  String toString() {
    return 'FormOptionState(isLoading: $isLoading, isParentLoading: $isParentLoading, list: $list, parentForms: $parentForms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormOptionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isParentLoading, isParentLoading) ||
                other.isParentLoading == isParentLoading) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._parentForms, _parentForms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isParentLoading,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_parentForms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormOptionStateImplCopyWith<_$FormOptionStateImpl> get copyWith =>
      __$$FormOptionStateImplCopyWithImpl<_$FormOptionStateImpl>(
          this, _$identity);
}

abstract class _FormOptionState extends FormOptionState {
  const factory _FormOptionState(
      {final bool isLoading,
      final bool isParentLoading,
      final List<FormOptionsData> list,
      final List<FormOptionsData> parentForms}) = _$FormOptionStateImpl;
  const _FormOptionState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isParentLoading;
  @override
  List<FormOptionsData> get list;
  @override
  List<FormOptionsData> get parentForms;
  @override
  @JsonKey(ignore: true)
  _$$FormOptionStateImplCopyWith<_$FormOptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
