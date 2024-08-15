// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCategoryState {
  String get title => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  CategoryData? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCategoryStateCopyWith<AddCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryStateCopyWith<$Res> {
  factory $AddCategoryStateCopyWith(
          AddCategoryState value, $Res Function(AddCategoryState) then) =
      _$AddCategoryStateCopyWithImpl<$Res, AddCategoryState>;
  @useResult
  $Res call(
      {String title,
      bool isLoading,
      bool active,
      String? imageFile,
      CategoryData? category});
}

/// @nodoc
class _$AddCategoryStateCopyWithImpl<$Res, $Val extends AddCategoryState>
    implements $AddCategoryStateCopyWith<$Res> {
  _$AddCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isLoading = null,
    Object? active = null,
    Object? imageFile = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCategoryStateImplCopyWith<$Res>
    implements $AddCategoryStateCopyWith<$Res> {
  factory _$$AddCategoryStateImplCopyWith(_$AddCategoryStateImpl value,
          $Res Function(_$AddCategoryStateImpl) then) =
      __$$AddCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      bool isLoading,
      bool active,
      String? imageFile,
      CategoryData? category});
}

/// @nodoc
class __$$AddCategoryStateImplCopyWithImpl<$Res>
    extends _$AddCategoryStateCopyWithImpl<$Res, _$AddCategoryStateImpl>
    implements _$$AddCategoryStateImplCopyWith<$Res> {
  __$$AddCategoryStateImplCopyWithImpl(_$AddCategoryStateImpl _value,
      $Res Function(_$AddCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isLoading = null,
    Object? active = null,
    Object? imageFile = freezed,
    Object? category = freezed,
  }) {
    return _then(_$AddCategoryStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc

class _$AddCategoryStateImpl extends _AddCategoryState {
  const _$AddCategoryStateImpl(
      {this.title = '',
      this.isLoading = false,
      this.active = true,
      this.imageFile,
      this.category})
      : super._();

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool active;
  @override
  final String? imageFile;
  @override
  final CategoryData? category;

  @override
  String toString() {
    return 'AddCategoryState(title: $title, isLoading: $isLoading, active: $active, imageFile: $imageFile, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategoryStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, isLoading, active, imageFile, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryStateImplCopyWith<_$AddCategoryStateImpl> get copyWith =>
      __$$AddCategoryStateImplCopyWithImpl<_$AddCategoryStateImpl>(
          this, _$identity);
}

abstract class _AddCategoryState extends AddCategoryState {
  const factory _AddCategoryState(
      {final String title,
      final bool isLoading,
      final bool active,
      final String? imageFile,
      final CategoryData? category}) = _$AddCategoryStateImpl;
  const _AddCategoryState._() : super._();

  @override
  String get title;
  @override
  bool get isLoading;
  @override
  bool get active;
  @override
  String? get imageFile;
  @override
  CategoryData? get category;
  @override
  @JsonKey(ignore: true)
  _$$AddCategoryStateImplCopyWith<_$AddCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
