// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_forms_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddFormOptionState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  FormOptionsData? get form => throw _privateConstructorUsedError;
  List<QuestionData> get questions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddFormOptionStateCopyWith<AddFormOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFormOptionStateCopyWith<$Res> {
  factory $AddFormOptionStateCopyWith(
          AddFormOptionState value, $Res Function(AddFormOptionState) then) =
      _$AddFormOptionStateCopyWithImpl<$Res, AddFormOptionState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool active,
      bool required,
      FormOptionsData? form,
      List<QuestionData> questions});
}

/// @nodoc
class _$AddFormOptionStateCopyWithImpl<$Res, $Val extends AddFormOptionState>
    implements $AddFormOptionStateCopyWith<$Res> {
  _$AddFormOptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? active = null,
    Object? required = null,
    Object? form = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      form: freezed == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormOptionsData?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFormOptionStateImplCopyWith<$Res>
    implements $AddFormOptionStateCopyWith<$Res> {
  factory _$$AddFormOptionStateImplCopyWith(_$AddFormOptionStateImpl value,
          $Res Function(_$AddFormOptionStateImpl) then) =
      __$$AddFormOptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool active,
      bool required,
      FormOptionsData? form,
      List<QuestionData> questions});
}

/// @nodoc
class __$$AddFormOptionStateImplCopyWithImpl<$Res>
    extends _$AddFormOptionStateCopyWithImpl<$Res, _$AddFormOptionStateImpl>
    implements _$$AddFormOptionStateImplCopyWith<$Res> {
  __$$AddFormOptionStateImplCopyWithImpl(_$AddFormOptionStateImpl _value,
      $Res Function(_$AddFormOptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? active = null,
    Object? required = null,
    Object? form = freezed,
    Object? questions = null,
  }) {
    return _then(_$AddFormOptionStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      form: freezed == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormOptionsData?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionData>,
    ));
  }
}

/// @nodoc

class _$AddFormOptionStateImpl extends _AddFormOptionState {
  const _$AddFormOptionStateImpl(
      {this.isLoading = false,
      this.active = true,
      this.required = true,
      this.form,
      final List<QuestionData> questions = const []})
      : _questions = questions,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final bool required;
  @override
  final FormOptionsData? form;
  final List<QuestionData> _questions;
  @override
  @JsonKey()
  List<QuestionData> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'AddFormOptionState(isLoading: $isLoading, active: $active, required: $required, form: $form, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFormOptionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.form, form) || other.form == form) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, active, required,
      form, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFormOptionStateImplCopyWith<_$AddFormOptionStateImpl> get copyWith =>
      __$$AddFormOptionStateImplCopyWithImpl<_$AddFormOptionStateImpl>(
          this, _$identity);
}

abstract class _AddFormOptionState extends AddFormOptionState {
  const factory _AddFormOptionState(
      {final bool isLoading,
      final bool active,
      final bool required,
      final FormOptionsData? form,
      final List<QuestionData> questions}) = _$AddFormOptionStateImpl;
  const _AddFormOptionState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get active;
  @override
  bool get required;
  @override
  FormOptionsData? get form;
  @override
  List<QuestionData> get questions;
  @override
  @JsonKey(ignore: true)
  _$$AddFormOptionStateImplCopyWith<_$AddFormOptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
