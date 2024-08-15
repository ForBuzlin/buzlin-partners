import 'package:venderuzmart/infrastructure/models/models.dart';

class CommentsPaginateResponse {
  List<CommentsData>? data;

  CommentsPaginateResponse({
    this.data,
  });

  CommentsPaginateResponse copyWith({
    List<CommentsData>? data,
  }) =>
      CommentsPaginateResponse(
        data: data ?? this.data,
      );

  factory CommentsPaginateResponse.fromJson(Map<String, dynamic> json) =>
      CommentsPaginateResponse(
        data: json["data"] == null
            ? []
            : List<CommentsData>.from(
                json["data"]!.map((x) => CommentsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
