// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_brands_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditBrandsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  List<Galleries> get listOfUrls => throw _privateConstructorUsedError;
  Brand? get brand => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditBrandsStateCopyWith<EditBrandsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditBrandsStateCopyWith<$Res> {
  factory $EditBrandsStateCopyWith(
          EditBrandsState value, $Res Function(EditBrandsState) then) =
      _$EditBrandsStateCopyWithImpl<$Res, EditBrandsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool active,
      String title,
      List<String> images,
      String? imageFile,
      List<Galleries> listOfUrls,
      Brand? brand});
}

/// @nodoc
class _$EditBrandsStateCopyWithImpl<$Res, $Val extends EditBrandsState>
    implements $EditBrandsStateCopyWith<$Res> {
  _$EditBrandsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? active = null,
    Object? title = null,
    Object? images = null,
    Object? imageFile = freezed,
    Object? listOfUrls = null,
    Object? brand = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfUrls: null == listOfUrls
          ? _value.listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditBrandsStateImplCopyWith<$Res>
    implements $EditBrandsStateCopyWith<$Res> {
  factory _$$EditBrandsStateImplCopyWith(_$EditBrandsStateImpl value,
          $Res Function(_$EditBrandsStateImpl) then) =
      __$$EditBrandsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool active,
      String title,
      List<String> images,
      String? imageFile,
      List<Galleries> listOfUrls,
      Brand? brand});
}

/// @nodoc
class __$$EditBrandsStateImplCopyWithImpl<$Res>
    extends _$EditBrandsStateCopyWithImpl<$Res, _$EditBrandsStateImpl>
    implements _$$EditBrandsStateImplCopyWith<$Res> {
  __$$EditBrandsStateImplCopyWithImpl(
      _$EditBrandsStateImpl _value, $Res Function(_$EditBrandsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? active = null,
    Object? title = null,
    Object? images = null,
    Object? imageFile = freezed,
    Object? listOfUrls = null,
    Object? brand = freezed,
  }) {
    return _then(_$EditBrandsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      listOfUrls: null == listOfUrls
          ? _value._listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
    ));
  }
}

/// @nodoc

class _$EditBrandsStateImpl extends _EditBrandsState {
  const _$EditBrandsStateImpl(
      {this.isLoading = false,
      this.active = false,
      this.title = '',
      final List<String> images = const [],
      this.imageFile,
      final List<Galleries> listOfUrls = const [],
      this.brand})
      : _images = images,
        _listOfUrls = listOfUrls,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final String title;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? imageFile;
  final List<Galleries> _listOfUrls;
  @override
  @JsonKey()
  List<Galleries> get listOfUrls {
    if (_listOfUrls is EqualUnmodifiableListView) return _listOfUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfUrls);
  }

  @override
  final Brand? brand;

  @override
  String toString() {
    return 'EditBrandsState(isLoading: $isLoading, active: $active, title: $title, images: $images, imageFile: $imageFile, listOfUrls: $listOfUrls, brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditBrandsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality()
                .equals(other._listOfUrls, _listOfUrls) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      active,
      title,
      const DeepCollectionEquality().hash(_images),
      imageFile,
      const DeepCollectionEquality().hash(_listOfUrls),
      brand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditBrandsStateImplCopyWith<_$EditBrandsStateImpl> get copyWith =>
      __$$EditBrandsStateImplCopyWithImpl<_$EditBrandsStateImpl>(
          this, _$identity);
}

abstract class _EditBrandsState extends EditBrandsState {
  const factory _EditBrandsState(
      {final bool isLoading,
      final bool active,
      final String title,
      final List<String> images,
      final String? imageFile,
      final List<Galleries> listOfUrls,
      final Brand? brand}) = _$EditBrandsStateImpl;
  const _EditBrandsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get active;
  @override
  String get title;
  @override
  List<String> get images;
  @override
  String? get imageFile;
  @override
  List<Galleries> get listOfUrls;
  @override
  Brand? get brand;
  @override
  @JsonKey(ignore: true)
  _$$EditBrandsStateImplCopyWith<_$EditBrandsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
