// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_category_parent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditCategoryParentState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  TextEditingController? get categoryController =>
      throw _privateConstructorUsedError;
  CategoryData? get selectCategory => throw _privateConstructorUsedError;
  CategoryData? get oldCategory => throw _privateConstructorUsedError;
  List<CategoryData> get selectCategories => throw _privateConstructorUsedError;
  List<TextEditingController> get categoryControllers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCategoryParentStateCopyWith<EditCategoryParentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCategoryParentStateCopyWith<$Res> {
  factory $EditCategoryParentStateCopyWith(EditCategoryParentState value,
          $Res Function(EditCategoryParentState) then) =
      _$EditCategoryParentStateCopyWithImpl<$Res, EditCategoryParentState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      TextEditingController? categoryController,
      CategoryData? selectCategory,
      CategoryData? oldCategory,
      List<CategoryData> selectCategories,
      List<TextEditingController> categoryControllers});
}

/// @nodoc
class _$EditCategoryParentStateCopyWithImpl<$Res,
        $Val extends EditCategoryParentState>
    implements $EditCategoryParentStateCopyWith<$Res> {
  _$EditCategoryParentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? categoryController = freezed,
    Object? selectCategory = freezed,
    Object? oldCategory = freezed,
    Object? selectCategories = null,
    Object? categoryControllers = null,
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
      categoryController: freezed == categoryController
          ? _value.categoryController
          : categoryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      oldCategory: freezed == oldCategory
          ? _value.oldCategory
          : oldCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      selectCategories: null == selectCategories
          ? _value.selectCategories
          : selectCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categoryControllers: null == categoryControllers
          ? _value.categoryControllers
          : categoryControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditCategoryParentStateImplCopyWith<$Res>
    implements $EditCategoryParentStateCopyWith<$Res> {
  factory _$$EditCategoryParentStateImplCopyWith(
          _$EditCategoryParentStateImpl value,
          $Res Function(_$EditCategoryParentStateImpl) then) =
      __$$EditCategoryParentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      TextEditingController? categoryController,
      CategoryData? selectCategory,
      CategoryData? oldCategory,
      List<CategoryData> selectCategories,
      List<TextEditingController> categoryControllers});
}

/// @nodoc
class __$$EditCategoryParentStateImplCopyWithImpl<$Res>
    extends _$EditCategoryParentStateCopyWithImpl<$Res,
        _$EditCategoryParentStateImpl>
    implements _$$EditCategoryParentStateImplCopyWith<$Res> {
  __$$EditCategoryParentStateImplCopyWithImpl(
      _$EditCategoryParentStateImpl _value,
      $Res Function(_$EditCategoryParentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? categoryController = freezed,
    Object? selectCategory = freezed,
    Object? oldCategory = freezed,
    Object? selectCategories = null,
    Object? categoryControllers = null,
  }) {
    return _then(_$EditCategoryParentStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categoryController: freezed == categoryController
          ? _value.categoryController
          : categoryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      oldCategory: freezed == oldCategory
          ? _value.oldCategory
          : oldCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      selectCategories: null == selectCategories
          ? _value._selectCategories
          : selectCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categoryControllers: null == categoryControllers
          ? _value._categoryControllers
          : categoryControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
    ));
  }
}

/// @nodoc

class _$EditCategoryParentStateImpl extends _EditCategoryParentState {
  const _$EditCategoryParentStateImpl(
      {this.isLoading = false,
      final List<CategoryData> categories = const [],
      this.categoryController,
      this.selectCategory,
      this.oldCategory,
      final List<CategoryData> selectCategories = const [],
      final List<TextEditingController> categoryControllers = const []})
      : _categories = categories,
        _selectCategories = selectCategories,
        _categoryControllers = categoryControllers,
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

  @override
  final TextEditingController? categoryController;
  @override
  final CategoryData? selectCategory;
  @override
  final CategoryData? oldCategory;
  final List<CategoryData> _selectCategories;
  @override
  @JsonKey()
  List<CategoryData> get selectCategories {
    if (_selectCategories is EqualUnmodifiableListView)
      return _selectCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectCategories);
  }

  final List<TextEditingController> _categoryControllers;
  @override
  @JsonKey()
  List<TextEditingController> get categoryControllers {
    if (_categoryControllers is EqualUnmodifiableListView)
      return _categoryControllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryControllers);
  }

  @override
  String toString() {
    return 'EditCategoryParentState(isLoading: $isLoading, categories: $categories, categoryController: $categoryController, selectCategory: $selectCategory, oldCategory: $oldCategory, selectCategories: $selectCategories, categoryControllers: $categoryControllers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCategoryParentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.categoryController, categoryController) ||
                other.categoryController == categoryController) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            (identical(other.oldCategory, oldCategory) ||
                other.oldCategory == oldCategory) &&
            const DeepCollectionEquality()
                .equals(other._selectCategories, _selectCategories) &&
            const DeepCollectionEquality()
                .equals(other._categoryControllers, _categoryControllers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      categoryController,
      selectCategory,
      oldCategory,
      const DeepCollectionEquality().hash(_selectCategories),
      const DeepCollectionEquality().hash(_categoryControllers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCategoryParentStateImplCopyWith<_$EditCategoryParentStateImpl>
      get copyWith => __$$EditCategoryParentStateImplCopyWithImpl<
          _$EditCategoryParentStateImpl>(this, _$identity);
}

abstract class _EditCategoryParentState extends EditCategoryParentState {
  const factory _EditCategoryParentState(
          {final bool isLoading,
          final List<CategoryData> categories,
          final TextEditingController? categoryController,
          final CategoryData? selectCategory,
          final CategoryData? oldCategory,
          final List<CategoryData> selectCategories,
          final List<TextEditingController> categoryControllers}) =
      _$EditCategoryParentStateImpl;
  const _EditCategoryParentState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryData> get categories;
  @override
  TextEditingController? get categoryController;
  @override
  CategoryData? get selectCategory;
  @override
  CategoryData? get oldCategory;
  @override
  List<CategoryData> get selectCategories;
  @override
  List<TextEditingController> get categoryControllers;
  @override
  @JsonKey(ignore: true)
  _$$EditCategoryParentStateImplCopyWith<_$EditCategoryParentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
