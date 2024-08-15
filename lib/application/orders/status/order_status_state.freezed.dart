// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderStatusState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  OrderData? get order => throw _privateConstructorUsedError;
  List<Notes> get notes => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  int? get editIndex => throw _privateConstructorUsedError;
  TextEditingController? get textEditingController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStatusStateCopyWith<OrderStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusStateCopyWith<$Res> {
  factory $OrderStatusStateCopyWith(
          OrderStatusState value, $Res Function(OrderStatusState) then) =
      _$OrderStatusStateCopyWithImpl<$Res, OrderStatusState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      OrderData? order,
      List<Notes> notes,
      String locale,
      int? editIndex,
      TextEditingController? textEditingController});
}

/// @nodoc
class _$OrderStatusStateCopyWithImpl<$Res, $Val extends OrderStatusState>
    implements $OrderStatusStateCopyWith<$Res> {
  _$OrderStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? order = freezed,
    Object? notes = null,
    Object? locale = null,
    Object? editIndex = freezed,
    Object? textEditingController = freezed,
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
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Notes>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      editIndex: freezed == editIndex
          ? _value.editIndex
          : editIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      textEditingController: freezed == textEditingController
          ? _value.textEditingController
          : textEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusStateImplCopyWith<$Res>
    implements $OrderStatusStateCopyWith<$Res> {
  factory _$$OrderStatusStateImplCopyWith(_$OrderStatusStateImpl value,
          $Res Function(_$OrderStatusStateImpl) then) =
      __$$OrderStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      OrderData? order,
      List<Notes> notes,
      String locale,
      int? editIndex,
      TextEditingController? textEditingController});
}

/// @nodoc
class __$$OrderStatusStateImplCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$OrderStatusStateImpl>
    implements _$$OrderStatusStateImplCopyWith<$Res> {
  __$$OrderStatusStateImplCopyWithImpl(_$OrderStatusStateImpl _value,
      $Res Function(_$OrderStatusStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? order = freezed,
    Object? notes = null,
    Object? locale = null,
    Object? editIndex = freezed,
    Object? textEditingController = freezed,
  }) {
    return _then(_$OrderStatusStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Notes>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      editIndex: freezed == editIndex
          ? _value.editIndex
          : editIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      textEditingController: freezed == textEditingController
          ? _value.textEditingController
          : textEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$OrderStatusStateImpl extends _OrderStatusState {
  const _$OrderStatusStateImpl(
      {this.isLoading = false,
      this.isUpdating = false,
      this.order = null,
      final List<Notes> notes = const [],
      this.locale = 'en',
      this.editIndex = null,
      this.textEditingController})
      : _notes = notes,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final OrderData? order;
  final List<Notes> _notes;
  @override
  @JsonKey()
  List<Notes> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  @JsonKey()
  final String locale;
  @override
  @JsonKey()
  final int? editIndex;
  @override
  final TextEditingController? textEditingController;

  @override
  String toString() {
    return 'OrderStatusState(isLoading: $isLoading, isUpdating: $isUpdating, order: $order, notes: $notes, locale: $locale, editIndex: $editIndex, textEditingController: $textEditingController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.editIndex, editIndex) ||
                other.editIndex == editIndex) &&
            (identical(other.textEditingController, textEditingController) ||
                other.textEditingController == textEditingController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isUpdating,
      order,
      const DeepCollectionEquality().hash(_notes),
      locale,
      editIndex,
      textEditingController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusStateImplCopyWith<_$OrderStatusStateImpl> get copyWith =>
      __$$OrderStatusStateImplCopyWithImpl<_$OrderStatusStateImpl>(
          this, _$identity);
}

abstract class _OrderStatusState extends OrderStatusState {
  const factory _OrderStatusState(
          {final bool isLoading,
          final bool isUpdating,
          final OrderData? order,
          final List<Notes> notes,
          final String locale,
          final int? editIndex,
          final TextEditingController? textEditingController}) =
      _$OrderStatusStateImpl;
  const _OrderStatusState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  OrderData? get order;
  @override
  List<Notes> get notes;
  @override
  String get locale;
  @override
  int? get editIndex;
  @override
  TextEditingController? get textEditingController;
  @override
  @JsonKey(ignore: true)
  _$$OrderStatusStateImplCopyWith<_$OrderStatusStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
