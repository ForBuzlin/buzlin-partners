import 'translation.dart';

class FormsData {
  int? id;
  int? shopId;
  int? required;
  bool? active;
  List<FormOptions>? data;
  Translation? translation;

  FormsData({
    this.id,
    this.shopId,
    this.required,
    this.active,
    this.data,
    this.translation,
  });

  FormsData copyWith({
    int? id,
    int? shopId,
    int? required,
    bool? active,
    List<FormOptions>? data,
    Translation? translation,
  }) =>
      FormsData(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        required: required ?? this.required,
        active: active ?? this.active,
        data: data ?? this.data,
        translation: translation ?? this.translation,
      );

  factory FormsData.fromJson(Map<String, dynamic> json) => FormsData(
    id: json["id"],
    shopId: json["shop_id"],
    required: json["required"],
    active: json["active"],
    data: json["data"] == null ? [] : List<FormOptions>.from(json["data"]!.map((x) => FormOptions.fromJson(x))),
    translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "required": required,
    "active": active,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "translation": translation?.toJson(),
  };
}

class FormOptions {
  List<String>? answer;
  String? question;
  int? required;
  String? answerType;

  FormOptions({
    this.answer,
    this.question,
    this.required,
    this.answerType,
  });

  FormOptions copyWith({
    List<String>? answer,
    String? question,
    int? required,
    String? answerType,
  }) =>
      FormOptions(
        answer: answer ?? this.answer,
        question: question ?? this.question,
        required: required ?? this.required,
        answerType: answerType ?? this.answerType,
      );

  factory FormOptions.fromJson(Map<String, dynamic> json) => FormOptions(
    answer: json["answer"] == null ? [] : List<String>.from(json["answer"]!.map((x) => x)),
    question: json["question"],
    required: json["required"],
    answerType: json["answer_type"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer == null ? [] : List<dynamic>.from(answer!.map((x) => x)),
    "question": question,
    "required": required,
    "answer_type": answerType,
  };
}