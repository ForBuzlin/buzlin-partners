// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CommentsData> get productComments => throw _privateConstructorUsedError;
  List<ShopCommentsData> get shopComments => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CommentsData> productComments,
      List<ShopCommentsData> shopComments,
      int activeIndex});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? productComments = null,
    Object? shopComments = null,
    Object? activeIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productComments: null == productComments
          ? _value.productComments
          : productComments // ignore: cast_nullable_to_non_nullable
              as List<CommentsData>,
      shopComments: null == shopComments
          ? _value.shopComments
          : shopComments // ignore: cast_nullable_to_non_nullable
              as List<ShopCommentsData>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsStateImplCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$CommentsStateImplCopyWith(
          _$CommentsStateImpl value, $Res Function(_$CommentsStateImpl) then) =
      __$$CommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CommentsData> productComments,
      List<ShopCommentsData> shopComments,
      int activeIndex});
}

/// @nodoc
class __$$CommentsStateImplCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$CommentsStateImpl>
    implements _$$CommentsStateImplCopyWith<$Res> {
  __$$CommentsStateImplCopyWithImpl(
      _$CommentsStateImpl _value, $Res Function(_$CommentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? productComments = null,
    Object? shopComments = null,
    Object? activeIndex = null,
  }) {
    return _then(_$CommentsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      productComments: null == productComments
          ? _value._productComments
          : productComments // ignore: cast_nullable_to_non_nullable
              as List<CommentsData>,
      shopComments: null == shopComments
          ? _value._shopComments
          : shopComments // ignore: cast_nullable_to_non_nullable
              as List<ShopCommentsData>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CommentsStateImpl extends _CommentsState {
  const _$CommentsStateImpl(
      {this.isLoading = false,
      final List<CommentsData> productComments = const [],
      final List<ShopCommentsData> shopComments = const [],
      this.activeIndex = 1})
      : _productComments = productComments,
        _shopComments = shopComments,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CommentsData> _productComments;
  @override
  @JsonKey()
  List<CommentsData> get productComments {
    if (_productComments is EqualUnmodifiableListView) return _productComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productComments);
  }

  final List<ShopCommentsData> _shopComments;
  @override
  @JsonKey()
  List<ShopCommentsData> get shopComments {
    if (_shopComments is EqualUnmodifiableListView) return _shopComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopComments);
  }

  @override
  @JsonKey()
  final int activeIndex;

  @override
  String toString() {
    return 'CommentsState(isLoading: $isLoading, productComments: $productComments, shopComments: $shopComments, activeIndex: $activeIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._productComments, _productComments) &&
            const DeepCollectionEquality()
                .equals(other._shopComments, _shopComments) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_productComments),
      const DeepCollectionEquality().hash(_shopComments),
      activeIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      __$$CommentsStateImplCopyWithImpl<_$CommentsStateImpl>(this, _$identity);
}

abstract class _CommentsState extends CommentsState {
  const factory _CommentsState(
      {final bool isLoading,
      final List<CommentsData> productComments,
      final List<ShopCommentsData> shopComments,
      final int activeIndex}) = _$CommentsStateImpl;
  const _CommentsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CommentsData> get productComments;
  @override
  List<ShopCommentsData> get shopComments;
  @override
  int get activeIndex;
  @override
  @JsonKey(ignore: true)
  _$$CommentsStateImplCopyWith<_$CommentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
