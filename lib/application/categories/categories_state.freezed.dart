// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  List<int> get selectParents => throw _privateConstructorUsedError;
  List<int> get selectSubs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      List<int> selectParents,
      List<int> selectSubs});
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? selectParents = null,
    Object? selectSubs = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectParents: null == selectParents
          ? _value.selectParents
          : selectParents // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectSubs: null == selectSubs
          ? _value.selectSubs
          : selectSubs // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesStateImplCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$$CategoriesStateImplCopyWith(_$CategoriesStateImpl value,
          $Res Function(_$CategoriesStateImpl) then) =
      __$$CategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      List<int> selectParents,
      List<int> selectSubs});
}

/// @nodoc
class __$$CategoriesStateImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesStateImpl>
    implements _$$CategoriesStateImplCopyWith<$Res> {
  __$$CategoriesStateImplCopyWithImpl(
      _$CategoriesStateImpl _value, $Res Function(_$CategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? selectParents = null,
    Object? selectSubs = null,
  }) {
    return _then(_$CategoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectParents: null == selectParents
          ? _value._selectParents
          : selectParents // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectSubs: null == selectSubs
          ? _value._selectSubs
          : selectSubs // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$CategoriesStateImpl extends _CategoriesState {
  const _$CategoriesStateImpl(
      {this.isLoading = false,
      final List<CategoryData> categories = const [],
      final List<int> selectParents = const [],
      final List<int> selectSubs = const []})
      : _categories = categories,
        _selectParents = selectParents,
        _selectSubs = selectSubs,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<int> _selectParents;
  @override
  @JsonKey()
  List<int> get selectParents {
    if (_selectParents is EqualUnmodifiableListView) return _selectParents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectParents);
  }

  final List<int> _selectSubs;
  @override
  @JsonKey()
  List<int> get selectSubs {
    if (_selectSubs is EqualUnmodifiableListView) return _selectSubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectSubs);
  }

  @override
  String toString() {
    return 'CategoriesState(isLoading: $isLoading, categories: $categories, selectParents: $selectParents, selectSubs: $selectSubs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._selectParents, _selectParents) &&
            const DeepCollectionEquality()
                .equals(other._selectSubs, _selectSubs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_selectParents),
      const DeepCollectionEquality().hash(_selectSubs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesStateImplCopyWith<_$CategoriesStateImpl> get copyWith =>
      __$$CategoriesStateImplCopyWithImpl<_$CategoriesStateImpl>(
          this, _$identity);
}

abstract class _CategoriesState extends CategoriesState {
  const factory _CategoriesState(
      {final bool isLoading,
      final List<CategoryData> categories,
      final List<int> selectParents,
      final List<int> selectSubs}) = _$CategoriesStateImpl;
  const _CategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryData> get categories;
  @override
  List<int> get selectParents;
  @override
  List<int> get selectSubs;
  @override
  @JsonKey(ignore: true)
  _$$CategoriesStateImplCopyWith<_$CategoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
