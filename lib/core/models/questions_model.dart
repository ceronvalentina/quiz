// To parse this JSON data, do
//
//     final questionsResponse = questionsResponseFromJson(jsonString);

import 'dart:convert';

QuestionsResponse questionsResponseFromJson(String str) =>
    QuestionsResponse.fromJson(json.decode(str));

String questionsResponseToJson(QuestionsResponse data) =>
    json.encode(data.toJson());

class QuestionsResponse {
  int status;
  String message;
  Data data;

  QuestionsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      QuestionsResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String question;
  List<String> answers;

  Datum({
    required this.id,
    required this.question,
    required this.answers,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        question: json["question"],
        answers: List<String>.from(json["answers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
      };
}
