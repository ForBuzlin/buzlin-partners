import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_forms_state.dart';

class AddFormNotifier extends StateNotifier<AddFormOptionState> {
  final FormOptionFacade _formRepository;

  AddFormNotifier(
    this._formRepository,
  ) : super(const AddFormOptionState());

  List<QuestionData> _localQuestions = [];
  ServiceData? _service;

  Future<void> initialForm({required BuildContext context}) async {
    _localQuestions = [
      QuestionData(answerType: DropDownValues.answerType.first)
    ];
    state = state.copyWith(
      isLoading: false,
      form: FormOptionsData(),
      active: true,
      required: true,
      questions: _localQuestions,
    );
  }

  setTemplate(FormOptionsData? form) {
    _localQuestions = form?.data ?? [];
    state = state.copyWith(
      isLoading: false,
      form: form,
      active: form?.active ?? false,
      required: form?.required == 1,
      questions: _localQuestions,
    );
    if (form?.data?.isEmpty ?? true) {
      addQuestion();
    }
  }

  setService(ServiceData? service) => _service = service;

  Future<void> createForm(
    BuildContext context, {
    required String title,
    required String description,
    ValueChanged<FormOptionsData?>? created,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _formRepository.addForm(
      title: title,
      description: description,
      active: state.active,
      required: state.required,
      questions: _localQuestions,
      serviceId: _service?.id ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        created?.call(data.data);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> add form failure: $failure');
        failed?.call();
      },
    );
  }

  setActive() {
    state = state.copyWith(active: !state.active);
  }

  setRequired() {
    state = state.copyWith(required: !state.required);
  }

  setQuestionRequired(int i) {
    _localQuestions[i] = _localQuestions[i]
        .copyWith(required: _localQuestions[i].required == 1 ? 0 : 0);
    state = state.copyWith(questions: _localQuestions);
  }

  addQuestionAnswer(int index) {
    List<String> answer = _localQuestions[index].answer ?? [];
    answer.add('');
    _localQuestions[index] = _localQuestions[index].copyWith(answer: answer);
    state = state.copyWith(questions: _localQuestions);
  }

  deleteQuestionAnswer(int index, int i) {
    List<String> answer = List.from(_localQuestions[index].answer ?? []);
    answer.removeAt(i);
    _localQuestions[index] = _localQuestions[index].copyWith(answer: answer);
    state = state.copyWith(questions: _localQuestions);
  }

  addQuestion() {
    _localQuestions
        .add(QuestionData(answerType: DropDownValues.answerType.first));
    state = state.copyWith(questions: _localQuestions);
  }

  setQuestion(String value, int index) {
    _localQuestions[index] = _localQuestions[index].copyWith(question: value);
  }

  setQuestionAnswer(String value, int index, int i) {
    List<String> answer = _localQuestions[index].answer ?? [];
    answer[i] = value;
    _localQuestions[index] = _localQuestions[index].copyWith(answer: answer);
    _localQuestions = _localQuestions;
  }

  deleteQuestion(int index) {
    _localQuestions.removeAt(index);
    state = state.copyWith(questions: _localQuestions);
  }

  changeAnswerType(String value, int index) {
    _localQuestions[index] = _localQuestions[index].copyWith(answerType: value);
    if (AppHelpers.getQuestionAnswer(value)) {
      if (_localQuestions[index].answer?.isEmpty ?? true) {
        addQuestionAnswer(index);
      }
    }
    state = state.copyWith(questions: _localQuestions);
  }
}
