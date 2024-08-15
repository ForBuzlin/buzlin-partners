import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_forms_state.dart';

class EditFormNotifier extends StateNotifier<EditFormOptionState> {
  final FormOptionFacade _formRepository;

  EditFormNotifier(this._formRepository) : super(const EditFormOptionState());
  List<QuestionData> _localQuestions = [];
  ServiceData? _service;

  setTemplate(FormOptionsData? form) {
    _localQuestions = form?.data ?? [];
    state = state.copyWith(
      isLoading: true,
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

  Future<void> fetchFormDetails({
    required BuildContext context,
    required FormOptionsData? form,
    required ValueChanged<FormOptionsData?>? onSuccess,
  }) async {
    _localQuestions = form?.data ?? [];
    state = state.copyWith(
        isLoading: true,
        form: form,
        active: form?.active ?? false,
        required: form?.required == 1,
        questions: _localQuestions);
    final res = await _formRepository.getFormOptionsDetails(form?.id);
    res.when(success: (data) {
      _localQuestions = data.data?.data ?? [];
      _service = data.data?.serviceMaster;
      state = state.copyWith(
          isLoading: false, form: data.data, questions: data.data?.data ?? []);
      onSuccess?.call(data.data);
      if (form?.data?.isEmpty ?? true) {
        addQuestion();
      }
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateForm(
    BuildContext context, {
    required String title,
    required String description,
    ValueChanged<FormOptionsData?>? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _formRepository.updateForm(
      title: title,
      description: description,
      id: state.form?.id ?? 0,
      active: state.active,
      required: state.required,
      questions: _localQuestions,
      serviceId: _service?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> update form failure: $failure');
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
