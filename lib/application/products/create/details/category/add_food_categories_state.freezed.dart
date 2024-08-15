// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_food_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddFoodCategoriesState {
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  CategoryData? get selectCategory => throw _privateConstructorUsedError;
  List<CategoryData> get selectCategories => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<TextEditingController> get categoryControllers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddFoodCategoriesStateCopyWith<AddFoodCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFoodCategoriesStateCopyWith<$Res> {
  factory $AddFoodCategoriesStateCopyWith(AddFoodCategoriesState value,
          $Res Function(AddFoodCategoriesState) then) =
      _$AddFoodCategoriesStateCopyWithImpl<$Res, AddFoodCategoriesState>;
  @useResult
  $Res call(
      {List<CategoryData> categories,
      CategoryData? selectCategory,
      List<CategoryData> selectCategories,
      bool isLoading,
      List<TextEditingController> categoryControllers});
}

/// @nodoc
class _$AddFoodCategoriesStateCopyWithImpl<$Res,
        $Val extends AddFoodCategoriesState>
    implements $AddFoodCategoriesStateCopyWith<$Res> {
  _$AddFoodCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? selectCategory = freezed,
    Object? selectCategories = null,
    Object? isLoading = null,
    Object? categoryControllers = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      selectCategories: null == selectCategories
          ? _value.selectCategories
          : selectCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryControllers: null == categoryControllers
          ? _value.categoryControllers
          : categoryControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFoodCategoriesStateImplCopyWith<$Res>
    implements $AddFoodCategoriesStateCopyWith<$Res> {
  factory _$$AddFoodCategoriesStateImplCopyWith(
          _$AddFoodCategoriesStateImpl value,
          $Res Function(_$AddFoodCategoriesStateImpl) then) =
      __$$AddFoodCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryData> categories,
      CategoryData? selectCategory,
      List<CategoryData> selectCategories,
      bool isLoading,
      List<TextEditingController> categoryControllers});
}

/// @nodoc
class __$$AddFoodCategoriesStateImplCopyWithImpl<$Res>
    extends _$AddFoodCategoriesStateCopyWithImpl<$Res,
        _$AddFoodCategoriesStateImpl>
    implements _$$AddFoodCategoriesStateImplCopyWith<$Res> {
  __$$AddFoodCategoriesStateImplCopyWithImpl(
      _$AddFoodCategoriesStateImpl _value,
      $Res Function(_$AddFoodCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? selectCategory = freezed,
    Object? selectCategories = null,
    Object? isLoading = null,
    Object? categoryControllers = null,
  }) {
    return _then(_$AddFoodCategoriesStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      selectCategories: null == selectCategories
          ? _value._selectCategories
          : selectCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryControllers: null == categoryControllers
          ? _value._categoryControllers
          : categoryControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
    ));
  }
}

/// @nodoc

class _$AddFoodCategoriesStateImpl extends _AddFoodCategoriesState {
  const _$AddFoodCategoriesStateImpl(
      {final List<CategoryData> categories = const [],
      this.selectCategory = null,
      final List<CategoryData> selectCategories = const [],
      this.isLoading = false,
      final List<TextEditingController> categoryControllers = const []})
      : _categories = categories,
        _selectCategories = selectCategories,
        _categoryControllers = categoryControllers,
        super._();

  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final CategoryData? selectCategory;
  final List<CategoryData> _selectCategories;
  @override
  @JsonKey()
  List<CategoryData> get selectCategories {
    if (_selectCategories is EqualUnmodifiableListView)
      return _selectCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectCategories);
  }

  @override
  @JsonKey()
  final bool isLoading;
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
    return 'AddFoodCategoriesState(categories: $categories, selectCategory: $selectCategory, selectCategories: $selectCategories, isLoading: $isLoading, categoryControllers: $categoryControllers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFoodCategoriesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            const DeepCollectionEquality()
                .equals(other._selectCategories, _selectCategories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categoryControllers, _categoryControllers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      selectCategory,
      const DeepCollectionEquality().hash(_selectCategories),
      isLoading,
      const DeepCollectionEquality().hash(_categoryControllers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFoodCategoriesStateImplCopyWith<_$AddFoodCategoriesStateImpl>
      get copyWith => __$$AddFoodCategoriesStateImplCopyWithImpl<
          _$AddFoodCategoriesStateImpl>(this, _$identity);
}

abstract class _AddFoodCategoriesState extends AddFoodCategoriesState {
  const factory _AddFoodCategoriesState(
          {final List<CategoryData> categories,
          final CategoryData? selectCategory,
          final List<CategoryData> selectCategories,
          final bool isLoading,
          final List<TextEditingController> categoryControllers}) =
      _$AddFoodCategoriesStateImpl;
  const _AddFoodCategoriesState._() : super._();

  @override
  List<CategoryData> get categories;
  @override
  CategoryData? get selectCategory;
  @override
  List<CategoryData> get selectCategories;
  @override
  bool get isLoading;
  @override
  List<TextEditingController> get categoryControllers;
  @override
  @JsonKey(ignore: true)
  _$$AddFoodCategoriesStateImplCopyWith<_$AddFoodCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
