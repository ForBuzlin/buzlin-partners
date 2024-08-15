// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_faqs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceFaqsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<FaqData> get faqs => throw _privateConstructorUsedError;
  ServiceData? get service => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceFaqsStateCopyWith<ServiceFaqsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceFaqsStateCopyWith<$Res> {
  factory $ServiceFaqsStateCopyWith(
          ServiceFaqsState value, $Res Function(ServiceFaqsState) then) =
      _$ServiceFaqsStateCopyWithImpl<$Res, ServiceFaqsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<FaqData> faqs,
      ServiceData? service});
}

/// @nodoc
class _$ServiceFaqsStateCopyWithImpl<$Res, $Val extends ServiceFaqsState>
    implements $ServiceFaqsStateCopyWith<$Res> {
  _$ServiceFaqsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? faqs = null,
    Object? service = freezed,
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
      faqs: null == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FaqData>,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceFaqsStateImplCopyWith<$Res>
    implements $ServiceFaqsStateCopyWith<$Res> {
  factory _$$ServiceFaqsStateImplCopyWith(_$ServiceFaqsStateImpl value,
          $Res Function(_$ServiceFaqsStateImpl) then) =
      __$$ServiceFaqsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<FaqData> faqs,
      ServiceData? service});
}

/// @nodoc
class __$$ServiceFaqsStateImplCopyWithImpl<$Res>
    extends _$ServiceFaqsStateCopyWithImpl<$Res, _$ServiceFaqsStateImpl>
    implements _$$ServiceFaqsStateImplCopyWith<$Res> {
  __$$ServiceFaqsStateImplCopyWithImpl(_$ServiceFaqsStateImpl _value,
      $Res Function(_$ServiceFaqsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? faqs = null,
    Object? service = freezed,
  }) {
    return _then(_$ServiceFaqsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      faqs: null == faqs
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<FaqData>,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceData?,
    ));
  }
}

/// @nodoc

class _$ServiceFaqsStateImpl extends _ServiceFaqsState {
  const _$ServiceFaqsStateImpl(
      {this.isLoading = false,
      this.isSaving = false,
      final List<FaqData> faqs = const [],
      this.service = null})
      : _faqs = faqs,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<FaqData> _faqs;
  @override
  @JsonKey()
  List<FaqData> get faqs {
    if (_faqs is EqualUnmodifiableListView) return _faqs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqs);
  }

  @override
  @JsonKey()
  final ServiceData? service;

  @override
  String toString() {
    return 'ServiceFaqsState(isLoading: $isLoading, isSaving: $isSaving, faqs: $faqs, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceFaqsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality().equals(other._faqs, _faqs) &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSaving,
      const DeepCollectionEquality().hash(_faqs), service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceFaqsStateImplCopyWith<_$ServiceFaqsStateImpl> get copyWith =>
      __$$ServiceFaqsStateImplCopyWithImpl<_$ServiceFaqsStateImpl>(
          this, _$identity);
}

abstract class _ServiceFaqsState extends ServiceFaqsState {
  const factory _ServiceFaqsState(
      {final bool isLoading,
      final bool isSaving,
      final List<FaqData> faqs,
      final ServiceData? service}) = _$ServiceFaqsStateImpl;
  const _ServiceFaqsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<FaqData> get faqs;
  @override
  ServiceData? get service;
  @override
  @JsonKey(ignore: true)
  _$$ServiceFaqsStateImplCopyWith<_$ServiceFaqsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
