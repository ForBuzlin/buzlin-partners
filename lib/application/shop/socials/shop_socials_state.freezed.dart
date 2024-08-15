// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_socials_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopSocialsState {
  bool get isSocialLoading => throw _privateConstructorUsedError;
  List<SocialData>? get socialData => throw _privateConstructorUsedError;
  List<TextEditingController> get socialControllers =>
      throw _privateConstructorUsedError;
  List<TextEditingController> get socialTypesController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopSocialsStateCopyWith<ShopSocialsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopSocialsStateCopyWith<$Res> {
  factory $ShopSocialsStateCopyWith(
          ShopSocialsState value, $Res Function(ShopSocialsState) then) =
      _$ShopSocialsStateCopyWithImpl<$Res, ShopSocialsState>;
  @useResult
  $Res call(
      {bool isSocialLoading,
      List<SocialData>? socialData,
      List<TextEditingController> socialControllers,
      List<TextEditingController> socialTypesController});
}

/// @nodoc
class _$ShopSocialsStateCopyWithImpl<$Res, $Val extends ShopSocialsState>
    implements $ShopSocialsStateCopyWith<$Res> {
  _$ShopSocialsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSocialLoading = null,
    Object? socialData = freezed,
    Object? socialControllers = null,
    Object? socialTypesController = null,
  }) {
    return _then(_value.copyWith(
      isSocialLoading: null == isSocialLoading
          ? _value.isSocialLoading
          : isSocialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      socialData: freezed == socialData
          ? _value.socialData
          : socialData // ignore: cast_nullable_to_non_nullable
              as List<SocialData>?,
      socialControllers: null == socialControllers
          ? _value.socialControllers
          : socialControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
      socialTypesController: null == socialTypesController
          ? _value.socialTypesController
          : socialTypesController // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopSocialsStateImplCopyWith<$Res>
    implements $ShopSocialsStateCopyWith<$Res> {
  factory _$$ShopSocialsStateImplCopyWith(_$ShopSocialsStateImpl value,
          $Res Function(_$ShopSocialsStateImpl) then) =
      __$$ShopSocialsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSocialLoading,
      List<SocialData>? socialData,
      List<TextEditingController> socialControllers,
      List<TextEditingController> socialTypesController});
}

/// @nodoc
class __$$ShopSocialsStateImplCopyWithImpl<$Res>
    extends _$ShopSocialsStateCopyWithImpl<$Res, _$ShopSocialsStateImpl>
    implements _$$ShopSocialsStateImplCopyWith<$Res> {
  __$$ShopSocialsStateImplCopyWithImpl(_$ShopSocialsStateImpl _value,
      $Res Function(_$ShopSocialsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSocialLoading = null,
    Object? socialData = freezed,
    Object? socialControllers = null,
    Object? socialTypesController = null,
  }) {
    return _then(_$ShopSocialsStateImpl(
      isSocialLoading: null == isSocialLoading
          ? _value.isSocialLoading
          : isSocialLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      socialData: freezed == socialData
          ? _value._socialData
          : socialData // ignore: cast_nullable_to_non_nullable
              as List<SocialData>?,
      socialControllers: null == socialControllers
          ? _value._socialControllers
          : socialControllers // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
      socialTypesController: null == socialTypesController
          ? _value._socialTypesController
          : socialTypesController // ignore: cast_nullable_to_non_nullable
              as List<TextEditingController>,
    ));
  }
}

/// @nodoc

class _$ShopSocialsStateImpl extends _ShopSocialsState {
  const _$ShopSocialsStateImpl(
      {this.isSocialLoading = false,
      final List<SocialData>? socialData,
      final List<TextEditingController> socialControllers = const [],
      final List<TextEditingController> socialTypesController = const []})
      : _socialData = socialData,
        _socialControllers = socialControllers,
        _socialTypesController = socialTypesController,
        super._();

  @override
  @JsonKey()
  final bool isSocialLoading;
  final List<SocialData>? _socialData;
  @override
  List<SocialData>? get socialData {
    final value = _socialData;
    if (value == null) return null;
    if (_socialData is EqualUnmodifiableListView) return _socialData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TextEditingController> _socialControllers;
  @override
  @JsonKey()
  List<TextEditingController> get socialControllers {
    if (_socialControllers is EqualUnmodifiableListView)
      return _socialControllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialControllers);
  }

  final List<TextEditingController> _socialTypesController;
  @override
  @JsonKey()
  List<TextEditingController> get socialTypesController {
    if (_socialTypesController is EqualUnmodifiableListView)
      return _socialTypesController;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialTypesController);
  }

  @override
  String toString() {
    return 'ShopSocialsState(isSocialLoading: $isSocialLoading, socialData: $socialData, socialControllers: $socialControllers, socialTypesController: $socialTypesController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopSocialsStateImpl &&
            (identical(other.isSocialLoading, isSocialLoading) ||
                other.isSocialLoading == isSocialLoading) &&
            const DeepCollectionEquality()
                .equals(other._socialData, _socialData) &&
            const DeepCollectionEquality()
                .equals(other._socialControllers, _socialControllers) &&
            const DeepCollectionEquality()
                .equals(other._socialTypesController, _socialTypesController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSocialLoading,
      const DeepCollectionEquality().hash(_socialData),
      const DeepCollectionEquality().hash(_socialControllers),
      const DeepCollectionEquality().hash(_socialTypesController));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopSocialsStateImplCopyWith<_$ShopSocialsStateImpl> get copyWith =>
      __$$ShopSocialsStateImplCopyWithImpl<_$ShopSocialsStateImpl>(
          this, _$identity);
}

abstract class _ShopSocialsState extends ShopSocialsState {
  const factory _ShopSocialsState(
          {final bool isSocialLoading,
          final List<SocialData>? socialData,
          final List<TextEditingController> socialControllers,
          final List<TextEditingController> socialTypesController}) =
      _$ShopSocialsStateImpl;
  const _ShopSocialsState._() : super._();

  @override
  bool get isSocialLoading;
  @override
  List<SocialData>? get socialData;
  @override
  List<TextEditingController> get socialControllers;
  @override
  List<TextEditingController> get socialTypesController;
  @override
  @JsonKey(ignore: true)
  _$$ShopSocialsStateImplCopyWith<_$ShopSocialsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
