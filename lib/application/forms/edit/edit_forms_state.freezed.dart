// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_forms_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditFormOptionState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  FormOptionsData? get form => throw _privateConstructorUsedError;
  List<QuestionData> get questions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditFormOptionStateCopyWith<EditFormOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditFormOptionStateCopyWith<$Res> {
  factory $EditFormOptionStateCopyWith(
          EditFormOptionState value, $Res Function(EditFormOptionState) then) =
      _$EditFormOptionStateCopyWithImpl<$Res, EditFormOptionState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool active,
      bool required,
      FormOptionsData? form,
      List<QuestionData> questions});
}

/// @nodoc
class _$EditFormOptionStateCopyWithImpl<$Res, $Val extends EditFormOptionState>
    implements $EditFormOptionStateCopyWith<$Res> {
  _$EditFormOptionStateCopyWithImpl(this._value, this._then);

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
abstract class _$$EditFormOptionStateImplCopyWith<$Res>
    implements $EditFormOptionStateCopyWith<$Res> {
  factory _$$EditFormOptionStateImplCopyWith(_$EditFormOptionStateImpl value,
          $Res Function(_$EditFormOptionStateImpl) then) =
      __$$EditFormOptionStateImplCopyWithImpl<$Res>;
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
class __$$EditFormOptionStateImplCopyWithImpl<$Res>
    extends _$EditFormOptionStateCopyWithImpl<$Res, _$EditFormOptionStateImpl>
    implements _$$EditFormOptionStateImplCopyWith<$Res> {
  __$$EditFormOptionStateImplCopyWithImpl(_$EditFormOptionStateImpl _value,
      $Res Function(_$EditFormOptionStateImpl) _then)
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
    return _then(_$EditFormOptionStateImpl(
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

class _$EditFormOptionStateImpl extends _EditFormOptionState {
  const _$EditFormOptionStateImpl(
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
    return 'EditFormOptionState(isLoading: $isLoading, active: $active, required: $required, form: $form, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFormOptionStateImpl &&
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
  _$$EditFormOptionStateImplCopyWith<_$EditFormOptionStateImpl> get copyWith =>
      __$$EditFormOptionStateImplCopyWithImpl<_$EditFormOptionStateImpl>(
          this, _$identity);
}

abstract class _EditFormOptionState extends EditFormOptionState {
  const factory _EditFormOptionState(
      {final bool isLoading,
      final bool active,
      final bool required,
      final FormOptionsData? form,
      final List<QuestionData> questions}) = _$EditFormOptionStateImpl;
  const _EditFormOptionState._() : super._();

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
  _$$EditFormOptionStateImplCopyWith<_$EditFormOptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
