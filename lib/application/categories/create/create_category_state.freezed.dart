// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateCategoryState {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get input => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isInitial => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  CategoryData? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateCategoryStateCopyWith<CreateCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCategoryStateCopyWith<$Res> {
  factory $CreateCategoryStateCopyWith(
          CreateCategoryState value, $Res Function(CreateCategoryState) then) =
      _$CreateCategoryStateCopyWithImpl<$Res, CreateCategoryState>;
  @useResult
  $Res call(
      {String title,
      String description,
      String input,
      bool active,
      bool isLoading,
      bool isInitial,
      String? imageFile,
      CategoryData? category});
}

/// @nodoc
class _$CreateCategoryStateCopyWithImpl<$Res, $Val extends CreateCategoryState>
    implements $CreateCategoryStateCopyWith<$Res> {
  _$CreateCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? input = null,
    Object? active = null,
    Object? isLoading = null,
    Object? isInitial = null,
    Object? imageFile = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CreateCategoryStateImplCopyWith<$Res>
    implements $CreateCategoryStateCopyWith<$Res> {
  factory _$$CreateCategoryStateImplCopyWith(_$CreateCategoryStateImpl value,
          $Res Function(_$CreateCategoryStateImpl) then) =
      __$$CreateCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String input,
      bool active,
      bool isLoading,
      bool isInitial,
      String? imageFile,
      CategoryData? category});
}

/// @nodoc
class __$$CreateCategoryStateImplCopyWithImpl<$Res>
    extends _$CreateCategoryStateCopyWithImpl<$Res, _$CreateCategoryStateImpl>
    implements _$$CreateCategoryStateImplCopyWith<$Res> {
  __$$CreateCategoryStateImplCopyWithImpl(_$CreateCategoryStateImpl _value,
      $Res Function(_$CreateCategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? input = null,
    Object? active = null,
    Object? isLoading = null,
    Object? isInitial = null,
    Object? imageFile = freezed,
    Object? category = freezed,
  }) {
    return _then(_$CreateCategoryStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
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

class _$CreateCategoryStateImpl extends _CreateCategoryState {
  const _$CreateCategoryStateImpl(
      {this.title = '',
      this.description = '',
      this.input = '',
      this.active = true,
      this.isLoading = false,
      this.isInitial = false,
      this.imageFile,
      this.category})
      : super._();

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String input;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isInitial;
  @override
  final String? imageFile;
  @override
  final CategoryData? category;

  @override
  String toString() {
    return 'CreateCategoryState(title: $title, description: $description, input: $input, active: $active, isLoading: $isLoading, isInitial: $isInitial, imageFile: $imageFile, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCategoryStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, input,
      active, isLoading, isInitial, imageFile, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCategoryStateImplCopyWith<_$CreateCategoryStateImpl> get copyWith =>
      __$$CreateCategoryStateImplCopyWithImpl<_$CreateCategoryStateImpl>(
          this, _$identity);
}

abstract class _CreateCategoryState extends CreateCategoryState {
  const factory _CreateCategoryState(
      {final String title,
      final String description,
      final String input,
      final bool active,
      final bool isLoading,
      final bool isInitial,
      final String? imageFile,
      final CategoryData? category}) = _$CreateCategoryStateImpl;
  const _CreateCategoryState._() : super._();

  @override
  String get title;
  @override
  String get description;
  @override
  String get input;
  @override
  bool get active;
  @override
  bool get isLoading;
  @override
  bool get isInitial;
  @override
  String? get imageFile;
  @override
  CategoryData? get category;
  @override
  @JsonKey(ignore: true)
  _$$CreateCategoryStateImplCopyWith<_$CreateCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
