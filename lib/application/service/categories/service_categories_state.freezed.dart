// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  List<CategoryData> get allCategories => throw _privateConstructorUsedError;
  List<int> get selectParents => throw _privateConstructorUsedError;
  List<int> get selectSubs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceCategoriesStateCopyWith<ServiceCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCategoriesStateCopyWith<$Res> {
  factory $ServiceCategoriesStateCopyWith(ServiceCategoriesState value,
          $Res Function(ServiceCategoriesState) then) =
      _$ServiceCategoriesStateCopyWithImpl<$Res, ServiceCategoriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      List<CategoryData> allCategories,
      List<int> selectParents,
      List<int> selectSubs});
}

/// @nodoc
class _$ServiceCategoriesStateCopyWithImpl<$Res,
        $Val extends ServiceCategoriesState>
    implements $ServiceCategoriesStateCopyWith<$Res> {
  _$ServiceCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? allCategories = null,
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
      allCategories: null == allCategories
          ? _value.allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ServiceCategoriesStateImplCopyWith<$Res>
    implements $ServiceCategoriesStateCopyWith<$Res> {
  factory _$$ServiceCategoriesStateImplCopyWith(
          _$ServiceCategoriesStateImpl value,
          $Res Function(_$ServiceCategoriesStateImpl) then) =
      __$$ServiceCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      List<CategoryData> allCategories,
      List<int> selectParents,
      List<int> selectSubs});
}

/// @nodoc
class __$$ServiceCategoriesStateImplCopyWithImpl<$Res>
    extends _$ServiceCategoriesStateCopyWithImpl<$Res,
        _$ServiceCategoriesStateImpl>
    implements _$$ServiceCategoriesStateImplCopyWith<$Res> {
  __$$ServiceCategoriesStateImplCopyWithImpl(
      _$ServiceCategoriesStateImpl _value,
      $Res Function(_$ServiceCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? allCategories = null,
    Object? selectParents = null,
    Object? selectSubs = null,
  }) {
    return _then(_$ServiceCategoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      allCategories: null == allCategories
          ? _value._allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
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

class _$ServiceCategoriesStateImpl extends _ServiceCategoriesState {
  const _$ServiceCategoriesStateImpl(
      {this.isLoading = false,
      final List<CategoryData> categories = const [],
      final List<CategoryData> allCategories = const [],
      final List<int> selectParents = const [],
      final List<int> selectSubs = const []})
      : _categories = categories,
        _allCategories = allCategories,
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

  final List<CategoryData> _allCategories;
  @override
  @JsonKey()
  List<CategoryData> get allCategories {
    if (_allCategories is EqualUnmodifiableListView) return _allCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCategories);
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
    return 'ServiceCategoriesState(isLoading: $isLoading, categories: $categories, allCategories: $allCategories, selectParents: $selectParents, selectSubs: $selectSubs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCategoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._allCategories, _allCategories) &&
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
      const DeepCollectionEquality().hash(_allCategories),
      const DeepCollectionEquality().hash(_selectParents),
      const DeepCollectionEquality().hash(_selectSubs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCategoriesStateImplCopyWith<_$ServiceCategoriesStateImpl>
      get copyWith => __$$ServiceCategoriesStateImplCopyWithImpl<
          _$ServiceCategoriesStateImpl>(this, _$identity);
}

abstract class _ServiceCategoriesState extends ServiceCategoriesState {
  const factory _ServiceCategoriesState(
      {final bool isLoading,
      final List<CategoryData> categories,
      final List<CategoryData> allCategories,
      final List<int> selectParents,
      final List<int> selectSubs}) = _$ServiceCategoriesStateImpl;
  const _ServiceCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryData> get categories;
  @override
  List<CategoryData> get allCategories;
  @override
  List<int> get selectParents;
  @override
  List<int> get selectSubs;
  @override
  @JsonKey(ignore: true)
  _$$ServiceCategoriesStateImplCopyWith<_$ServiceCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
