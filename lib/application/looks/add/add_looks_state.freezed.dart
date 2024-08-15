// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_looks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddLooksState {
  bool get active => throw _privateConstructorUsedError;
  String? get imageFile => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  LooksData? get looksData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddLooksStateCopyWith<AddLooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddLooksStateCopyWith<$Res> {
  factory $AddLooksStateCopyWith(
          AddLooksState value, $Res Function(AddLooksState) then) =
      _$AddLooksStateCopyWithImpl<$Res, AddLooksState>;
  @useResult
  $Res call(
      {bool active,
      String? imageFile,
      List<ProductData> products,
      bool isLoading,
      LooksData? looksData});
}

/// @nodoc
class _$AddLooksStateCopyWithImpl<$Res, $Val extends AddLooksState>
    implements $AddLooksStateCopyWith<$Res> {
  _$AddLooksStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AddLooksStateImplCopyWith<$Res>
    implements $AddLooksStateCopyWith<$Res> {
  factory _$$AddLooksStateImplCopyWith(
          _$AddLooksStateImpl value, $Res Function(_$AddLooksStateImpl) then) =
      __$$AddLooksStateImplCopyWithImpl<$Res>;
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
class __$$AddLooksStateImplCopyWithImpl<$Res>
    extends _$AddLooksStateCopyWithImpl<$Res, _$AddLooksStateImpl>
    implements _$$AddLooksStateImplCopyWith<$Res> {
  __$$AddLooksStateImplCopyWithImpl(
      _$AddLooksStateImpl _value, $Res Function(_$AddLooksStateImpl) _then)
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
    return _then(_$AddLooksStateImpl(
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

class _$AddLooksStateImpl extends _AddLooksState {
  const _$AddLooksStateImpl(
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
    return 'AddLooksState(active: $active, imageFile: $imageFile, products: $products, isLoading: $isLoading, looksData: $looksData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddLooksStateImpl &&
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
  _$$AddLooksStateImplCopyWith<_$AddLooksStateImpl> get copyWith =>
      __$$AddLooksStateImplCopyWithImpl<_$AddLooksStateImpl>(this, _$identity);
}

abstract class _AddLooksState extends AddLooksState {
  const factory _AddLooksState(
      {final bool active,
      final String? imageFile,
      final List<ProductData> products,
      final bool isLoading,
      final LooksData? looksData}) = _$AddLooksStateImpl;
  const _AddLooksState._() : super._();

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
  _$$AddLooksStateImplCopyWith<_$AddLooksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
