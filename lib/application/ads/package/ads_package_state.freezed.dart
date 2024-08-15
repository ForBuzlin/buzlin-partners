// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_package_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdsPackageState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<AdsPackage> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdsPackageStateCopyWith<AdsPackageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsPackageStateCopyWith<$Res> {
  factory $AdsPackageStateCopyWith(
          AdsPackageState value, $Res Function(AdsPackageState) then) =
      _$AdsPackageStateCopyWithImpl<$Res, AdsPackageState>;
  @useResult
  $Res call({bool isLoading, List<AdsPackage> list});
}

/// @nodoc
class _$AdsPackageStateCopyWithImpl<$Res, $Val extends AdsPackageState>
    implements $AdsPackageStateCopyWith<$Res> {
  _$AdsPackageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<AdsPackage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsPackageImplCopyWith<$Res>
    implements $AdsPackageStateCopyWith<$Res> {
  factory _$$AdsPackageImplCopyWith(
          _$AdsPackageImpl value, $Res Function(_$AdsPackageImpl) then) =
      __$$AdsPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<AdsPackage> list});
}

/// @nodoc
class __$$AdsPackageImplCopyWithImpl<$Res>
    extends _$AdsPackageStateCopyWithImpl<$Res, _$AdsPackageImpl>
    implements _$$AdsPackageImplCopyWith<$Res> {
  __$$AdsPackageImplCopyWithImpl(
      _$AdsPackageImpl _value, $Res Function(_$AdsPackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_$AdsPackageImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<AdsPackage>,
    ));
  }
}

/// @nodoc

class _$AdsPackageImpl extends _AdsPackage {
  const _$AdsPackageImpl(
      {this.isLoading = false, final List<AdsPackage> list = const []})
      : _list = list,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<AdsPackage> _list;
  @override
  @JsonKey()
  List<AdsPackage> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'AdsPackageState(isLoading: $isLoading, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsPackageImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsPackageImplCopyWith<_$AdsPackageImpl> get copyWith =>
      __$$AdsPackageImplCopyWithImpl<_$AdsPackageImpl>(this, _$identity);
}

abstract class _AdsPackage extends AdsPackageState {
  const factory _AdsPackage(
      {final bool isLoading, final List<AdsPackage> list}) = _$AdsPackageImpl;
  const _AdsPackage._() : super._();

  @override
  bool get isLoading;
  @override
  List<AdsPackage> get list;
  @override
  @JsonKey(ignore: true)
  _$$AdsPackageImplCopyWith<_$AdsPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
