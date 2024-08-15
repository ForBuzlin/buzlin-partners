// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_product_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProductGalleryState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<Extras> get extras => throw _privateConstructorUsedError;
  Map<String, List<String?>> get images => throw _privateConstructorUsedError;
  Map<String, List<Galleries?>> get listOfUrls =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProductGalleryStateCopyWith<EditProductGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProductGalleryStateCopyWith<$Res> {
  factory $EditProductGalleryStateCopyWith(EditProductGalleryState value,
          $Res Function(EditProductGalleryState) then) =
      _$EditProductGalleryStateCopyWithImpl<$Res, EditProductGalleryState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<Extras> extras,
      Map<String, List<String?>> images,
      Map<String, List<Galleries?>> listOfUrls});
}

/// @nodoc
class _$EditProductGalleryStateCopyWithImpl<$Res,
        $Val extends EditProductGalleryState>
    implements $EditProductGalleryStateCopyWith<$Res> {
  _$EditProductGalleryStateCopyWithImpl(this._value, this._then);

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
abstract class _$$EditProductGalleryImplCopyWith<$Res>
    implements $EditProductGalleryStateCopyWith<$Res> {
  factory _$$EditProductGalleryImplCopyWith(_$EditProductGalleryImpl value,
          $Res Function(_$EditProductGalleryImpl) then) =
      __$$EditProductGalleryImplCopyWithImpl<$Res>;
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
class __$$EditProductGalleryImplCopyWithImpl<$Res>
    extends _$EditProductGalleryStateCopyWithImpl<$Res,
        _$EditProductGalleryImpl>
    implements _$$EditProductGalleryImplCopyWith<$Res> {
  __$$EditProductGalleryImplCopyWithImpl(_$EditProductGalleryImpl _value,
      $Res Function(_$EditProductGalleryImpl) _then)
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
    return _then(_$EditProductGalleryImpl(
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

class _$EditProductGalleryImpl extends _EditProductGallery {
  const _$EditProductGalleryImpl(
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
    return 'EditProductGalleryState(isLoading: $isLoading, isSaving: $isSaving, extras: $extras, images: $images, listOfUrls: $listOfUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProductGalleryImpl &&
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
  _$$EditProductGalleryImplCopyWith<_$EditProductGalleryImpl> get copyWith =>
      __$$EditProductGalleryImplCopyWithImpl<_$EditProductGalleryImpl>(
          this, _$identity);
}

abstract class _EditProductGallery extends EditProductGalleryState {
  const factory _EditProductGallery(
          {final bool isLoading,
          final bool isSaving,
          final List<Extras> extras,
          final Map<String, List<String?>> images,
          final Map<String, List<Galleries?>> listOfUrls}) =
      _$EditProductGalleryImpl;
  const _EditProductGallery._() : super._();

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
  _$$EditProductGalleryImplCopyWith<_$EditProductGalleryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
