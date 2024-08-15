// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_galleries_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopGalleriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<Galleries> get listOfUrls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopGalleriesStateCopyWith<ShopGalleriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopGalleriesStateCopyWith<$Res> {
  factory $ShopGalleriesStateCopyWith(
          ShopGalleriesState value, $Res Function(ShopGalleriesState) then) =
      _$ShopGalleriesStateCopyWithImpl<$Res, ShopGalleriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      List<String> images,
      List<Galleries> listOfUrls});
}

/// @nodoc
class _$ShopGalleriesStateCopyWithImpl<$Res, $Val extends ShopGalleriesState>
    implements $ShopGalleriesStateCopyWith<$Res> {
  _$ShopGalleriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? images = null,
    Object? listOfUrls = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listOfUrls: null == listOfUrls
          ? _value.listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopGalleriesStateImplCopyWith<$Res>
    implements $ShopGalleriesStateCopyWith<$Res> {
  factory _$$ShopGalleriesStateImplCopyWith(_$ShopGalleriesStateImpl value,
          $Res Function(_$ShopGalleriesStateImpl) then) =
      __$$ShopGalleriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      List<String> images,
      List<Galleries> listOfUrls});
}

/// @nodoc
class __$$ShopGalleriesStateImplCopyWithImpl<$Res>
    extends _$ShopGalleriesStateCopyWithImpl<$Res, _$ShopGalleriesStateImpl>
    implements _$$ShopGalleriesStateImplCopyWith<$Res> {
  __$$ShopGalleriesStateImplCopyWithImpl(_$ShopGalleriesStateImpl _value,
      $Res Function(_$ShopGalleriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? images = null,
    Object? listOfUrls = null,
  }) {
    return _then(_$ShopGalleriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      listOfUrls: null == listOfUrls
          ? _value._listOfUrls
          : listOfUrls // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
    ));
  }
}

/// @nodoc

class _$ShopGalleriesStateImpl extends _ShopGalleriesState {
  const _$ShopGalleriesStateImpl(
      {this.isLoading = false,
      this.isUpdating = false,
      final List<String> images = const [],
      final List<Galleries> listOfUrls = const []})
      : _images = images,
        _listOfUrls = listOfUrls,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Galleries> _listOfUrls;
  @override
  @JsonKey()
  List<Galleries> get listOfUrls {
    if (_listOfUrls is EqualUnmodifiableListView) return _listOfUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfUrls);
  }

  @override
  String toString() {
    return 'ShopGalleriesState(isLoading: $isLoading, isUpdating: $isUpdating, images: $images, listOfUrls: $listOfUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopGalleriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._listOfUrls, _listOfUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isUpdating,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_listOfUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopGalleriesStateImplCopyWith<_$ShopGalleriesStateImpl> get copyWith =>
      __$$ShopGalleriesStateImplCopyWithImpl<_$ShopGalleriesStateImpl>(
          this, _$identity);
}

abstract class _ShopGalleriesState extends ShopGalleriesState {
  const factory _ShopGalleriesState(
      {final bool isLoading,
      final bool isUpdating,
      final List<String> images,
      final List<Galleries> listOfUrls}) = _$ShopGalleriesStateImpl;
  const _ShopGalleriesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  List<String> get images;
  @override
  List<Galleries> get listOfUrls;
  @override
  @JsonKey(ignore: true)
  _$$ShopGalleriesStateImplCopyWith<_$ShopGalleriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
