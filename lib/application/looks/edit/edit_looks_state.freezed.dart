// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_looks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditLooksState {
  bool get active => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  LooksData? get looksData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditLooksStateCopyWith<EditLooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditLooksStateCopyWith<$Res> {
  factory $EditLooksStateCopyWith(
          EditLooksState value, $Res Function(EditLooksState) then) =
      _$EditLooksStateCopyWithImpl<$Res, EditLooksState>;
  @useResult
  $Res call(
      {bool active,
      String? imageFile,
      List<ProductData> products,
      bool isLoading,
      LooksData? looksData});
}

/// @nodoc
class _$EditLooksStateCopyWithImpl<$Res, $Val extends EditLooksState>
    implements $EditLooksStateCopyWith<$Res> {
  _$EditLooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? imageFile = freezed,
    Object? products = null,
    Object? isLoading = null,
    Object? looksData = freezed,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      looksData: freezed == looksData
          ? _value.looksData
          : looksData // ignore: cast_nullable_to_non_nullable
              as LooksData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditLooksStateImplCopyWith<$Res>
    implements $EditLooksStateCopyWith<$Res> {
  factory _$$EditLooksStateImplCopyWith(_$EditLooksStateImpl value,
          $Res Function(_$EditLooksStateImpl) then) =
      __$$EditLooksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      String? imageFile,
      List<ProductData> products,
      bool isLoading,
      LooksData? looksData});
}

/// @nodoc
class __$$EditLooksStateImplCopyWithImpl<$Res>
    extends _$EditLooksStateCopyWithImpl<$Res, _$EditLooksStateImpl>
    implements _$$EditLooksStateImplCopyWith<$Res> {
  __$$EditLooksStateImplCopyWithImpl(
      _$EditLooksStateImpl _value, $Res Function(_$EditLooksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? imageFile = freezed,
    Object? products = null,
    Object? isLoading = null,
    Object? looksData = freezed,
  }) {
    return _then(_$EditLooksStateImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      looksData: freezed == looksData
          ? _value.looksData
          : looksData // ignore: cast_nullable_to_non_nullable
              as LooksData?,
    ));
  }
}

/// @nodoc

class _$EditLooksStateImpl extends _EditLooksState {
  const _$EditLooksStateImpl(
      {this.active = true,
      this.imageFile,
      final List<ProductData> products = const [],
      this.isLoading = false,
      this.looksData})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool active;
  @override
  final String? imageFile;
  final List<ProductData> _products;
  @override
  @JsonKey()
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final LooksData? looksData;

  @override
  String toString() {
    return 'EditLooksState(active: $active, imageFile: $imageFile, products: $products, isLoading: $isLoading, looksData: $looksData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditLooksStateImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.looksData, looksData) ||
                other.looksData == looksData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, active, imageFile,
      const DeepCollectionEquality().hash(_products), isLoading, looksData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditLooksStateImplCopyWith<_$EditLooksStateImpl> get copyWith =>
      __$$EditLooksStateImplCopyWithImpl<_$EditLooksStateImpl>(
          this, _$identity);
}

abstract class _EditLooksState extends EditLooksState {
  const factory _EditLooksState(
      {final bool active,
      final String? imageFile,
      final List<ProductData> products,
      final bool isLoading,
      final LooksData? looksData}) = _$EditLooksStateImpl;
  const _EditLooksState._() : super._();

  @override
  bool get active;
  @override
  String? get imageFile;
  @override
  List<ProductData> get products;
  @override
  bool get isLoading;
  @override
  LooksData? get looksData;
  @override
  @JsonKey(ignore: true)
  _$$EditLooksStateImplCopyWith<_$EditLooksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
