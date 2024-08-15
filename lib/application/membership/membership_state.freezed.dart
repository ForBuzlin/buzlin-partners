// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MembershipState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<MembershipData> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MembershipStateCopyWith<MembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipStateCopyWith<$Res> {
  factory $MembershipStateCopyWith(
          MembershipState value, $Res Function(MembershipState) then) =
      _$MembershipStateCopyWithImpl<$Res, MembershipState>;
  @useResult
  $Res call({bool isLoading, List<MembershipData> list});
}

/// @nodoc
class _$MembershipStateCopyWithImpl<$Res, $Val extends MembershipState>
    implements $MembershipStateCopyWith<$Res> {
  _$MembershipStateCopyWithImpl(this._value, this._then);

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
              as List<MembershipData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MembershipStateImplCopyWith<$Res>
    implements $MembershipStateCopyWith<$Res> {
  factory _$$MembershipStateImplCopyWith(_$MembershipStateImpl value,
          $Res Function(_$MembershipStateImpl) then) =
      __$$MembershipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<MembershipData> list});
}

/// @nodoc
class __$$MembershipStateImplCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res, _$MembershipStateImpl>
    implements _$$MembershipStateImplCopyWith<$Res> {
  __$$MembershipStateImplCopyWithImpl(
      _$MembershipStateImpl _value, $Res Function(_$MembershipStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
  }) {
    return _then(_$MembershipStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<MembershipData>,
    ));
  }
}

/// @nodoc

class _$MembershipStateImpl extends _MembershipState {
  const _$MembershipStateImpl(
      {this.isLoading = false, final List<MembershipData> list = const []})
      : _list = list,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<MembershipData> _list;
  @override
  @JsonKey()
  List<MembershipData> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'MembershipState(isLoading: $isLoading, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipStateImpl &&
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
  _$$MembershipStateImplCopyWith<_$MembershipStateImpl> get copyWith =>
      __$$MembershipStateImplCopyWithImpl<_$MembershipStateImpl>(
          this, _$identity);
}

abstract class _MembershipState extends MembershipState {
  const factory _MembershipState(
      {final bool isLoading,
      final List<MembershipData> list}) = _$MembershipStateImpl;
  const _MembershipState._() : super._();

  @override
  bool get isLoading;
  @override
  List<MembershipData> get list;
  @override
  @JsonKey(ignore: true)
  _$$MembershipStateImplCopyWith<_$MembershipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
