// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateProductGalleryState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<Extras> get extras => throw _privateConstructorUsedError;
  Map<String, List<String?>> get images => throw _privateConstructorUsedError;
  Map<String, List<Galleries?>> get listOfUrls =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateProductGalleryStateCopyWith<CreateProductGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProductGalleryStateCopyWith<$Res> {
  factory $CreateProductGalleryStateCopyWith(CreateProductGalleryState value,
          $Res Function(CreateProductGalleryState) then) =
      _$CreateProductGalleryStateCopyWithImpl<$Res, CreateProductGalleryState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<Extras> extras,
      Map<String, List<String?>> images,
      Map<String, List<Galleries?>> listOfUrls});
}

/// @nodoc
class _$CreateProductGalleryStateCopyWithImpl<$Res,
        $Val extends CreateProductGalleryState>
    implements $CreateProductGalleryStateCopyWith<$Res> {
  _$CreateProductGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? extras = null,
    Object? images = null,
    Object? listOfUrls = null,
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
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<Extras>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String?>>,
      listOfUrls: null == listOfUrls
          ? _value.listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Galleries?>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProductGalleryImplCopyWith<$Res>
    implements $CreateProductGalleryStateCopyWith<$Res> {
  factory _$$CreateProductGalleryImplCopyWith(_$CreateProductGalleryImpl value,
          $Res Function(_$CreateProductGalleryImpl) then) =
      __$$CreateProductGalleryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<Extras> extras,
      Map<String, List<String?>> images,
      Map<String, List<Galleries?>> listOfUrls});
}

/// @nodoc
class __$$CreateProductGalleryImplCopyWithImpl<$Res>
    extends _$CreateProductGalleryStateCopyWithImpl<$Res,
        _$CreateProductGalleryImpl>
    implements _$$CreateProductGalleryImplCopyWith<$Res> {
  __$$CreateProductGalleryImplCopyWithImpl(_$CreateProductGalleryImpl _value,
      $Res Function(_$CreateProductGalleryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? extras = null,
    Object? images = null,
    Object? listOfUrls = null,
  }) {
    return _then(_$CreateProductGalleryImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: null == extras
          ? _value._extras
          : extras // ignore: cast_nullable_to_non_nullable
              as List<Extras>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String?>>,
      listOfUrls: null == listOfUrls
          ? _value._listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Galleries?>>,
    ));
  }
}

/// @nodoc

class _$CreateProductGalleryImpl extends _CreateProductGallery {
  const _$CreateProductGalleryImpl(
      {this.isLoading = false,
      this.isSaving = false,
      final List<Extras> extras = const [],
      final Map<String, List<String?>> images = const {},
      final Map<String, List<Galleries?>> listOfUrls = const {}})
      : _extras = extras,
        _images = images,
        _listOfUrls = listOfUrls,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<Extras> _extras;
  @override
  @JsonKey()
  List<Extras> get extras {
    if (_extras is EqualUnmodifiableListView) return _extras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extras);
  }

  final Map<String, List<String?>> _images;
  @override
  @JsonKey()
  Map<String, List<String?>> get images {
    if (_images is EqualUnmodifiableMapView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_images);
  }

  final Map<String, List<Galleries?>> _listOfUrls;
  @override
  @JsonKey()
  Map<String, List<Galleries?>> get listOfUrls {
    if (_listOfUrls is EqualUnmodifiableMapView) return _listOfUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_listOfUrls);
  }

  @override
  String toString() {
    return 'CreateProductGalleryState(isLoading: $isLoading, isSaving: $isSaving, extras: $extras, images: $images, listOfUrls: $listOfUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProductGalleryImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality().equals(other._extras, _extras) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._listOfUrls, _listOfUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSaving,
      const DeepCollectionEquality().hash(_extras),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_listOfUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProductGalleryImplCopyWith<_$CreateProductGalleryImpl>
      get copyWith =>
          __$$CreateProductGalleryImplCopyWithImpl<_$CreateProductGalleryImpl>(
              this, _$identity);
}

abstract class _CreateProductGallery extends CreateProductGalleryState {
  const factory _CreateProductGallery(
          {final bool isLoading,
          final bool isSaving,
          final List<Extras> extras,
          final Map<String, List<String?>> images,
          final Map<String, List<Galleries?>> listOfUrls}) =
      _$CreateProductGalleryImpl;
  const _CreateProductGallery._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<Extras> get extras;
  @override
  Map<String, List<String?>> get images;
  @override
  Map<String, List<Galleries?>> get listOfUrls;
  @override
  @JsonKey(ignore: true)
  _$$CreateProductGalleryImplCopyWith<_$CreateProductGalleryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
