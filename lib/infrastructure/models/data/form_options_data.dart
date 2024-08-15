import 'package:venderuzmart/infrastructure/services/app_helpers.dart';

import 'service_data.dart';
import 'shop_data.dart';
import 'translation.dart';

class FormOptionsData {
  int? id;
  int? shopId;
  int? serviceMasterId;
  int? required;
  bool? active;
  List<QuestionData>? data;
  ShopData? shop;
  ServiceData? serviceMaster;
  Translation? translation;
  List<Translation>? translations;

  FormOptionsData({
    this.id,
    this.shopId,
    this.serviceMasterId,
    this.required,
    this.active,
    this.data,
    this.shop,
    this.serviceMaster,
    this.translation,
    this.translations,
  });

  FormOptionsData copyWith({
    int? id,
    int? shopId,
    int? serviceMasterId,
    int? required,
    bool? active,
    List<QuestionData>? data,
    ShopData? shop,
    ServiceData? serviceMaster,
    Translation? translation,
    List<Translation>? translations,
  }) =>
      FormOptionsData(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        serviceMasterId: serviceMasterId ?? this.serviceMasterId,
        required: required ?? this.required,
        active: active ?? this.active,
        data: data ?? this.data,
        shop: shop ?? this.shop,
        serviceMaster: serviceMaster ?? this.serviceMaster,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
      );

  factory FormOptionsData.fromJson(Map<String, dynamic> json) =>
      FormOptionsData(
        id: json["id"],
        shopId: json["shop_id"],
        serviceMasterId: json["service_master_id"],
        required: json["required"],
        active: json["active"],
        data: json["data"] == null
            ? []
            : List<QuestionData>.from(
                json["data"]!.map((x) => QuestionData.fromJson(x))),
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        serviceMaster: json["service_master"] == null
            ? null
            : ServiceData.fromJson(json["service_master"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "service_master_id": serviceMasterId,
        "required": required,
        "active": active,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "shop": shop?.toJson(),
        "service_master": serviceMaster?.toJson(),
        "translation": translation?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}

class QuestionData {
  List<String>? answer;
  List<dynamic>? userAnswer;
  String? question;
  int? required;
  String? answerType;

  QuestionData({
    this.answer,
    this.question,
    this.required,
    this.answerType,
    this.userAnswer,
  });

  QuestionData copyWith({
    List<String>? answer,
    List<dynamic>? userAnswer,
    String? question,
    int? required,
    String? answerType,
  }) =>
      QuestionData(
        answer: answer ?? this.answer,
        question: question ?? this.question,
        required: required ?? this.required,
        answerType: answerType ?? this.answerType,
        userAnswer: userAnswer ?? this.userAnswer,
      );

  factory QuestionData.fromJson(Map<String, dynamic> json) => QuestionData(
        answer: json["answer"] == null
            ? []
            : List<String>.from(json["answer"]!.map((x) => x)),
    userAnswer: json["user_answer"] == null
            ? []
            : List<dynamic>.from(json["user_answer"]!.map((x) => x)),
        question: json["question"],
        required: json["required"],
        answerType: json["answer_type"],
      );

  Map<String, dynamic> toJson() => {
        if (AppHelpers.getQuestionAnswer(answerType)) "answer": List<dynamic>.from(answer!.map((x) => x)),
        if (userAnswer != null) "user_answer": List<dynamic>.from(answer!.map((x) => x)),
        "question": question,
        "required": required ?? 0,
        "answer_type": answerType,
      };
}
