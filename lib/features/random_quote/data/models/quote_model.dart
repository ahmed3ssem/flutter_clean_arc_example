import 'dart:convert';

import 'package:flutter_clean_arc_example/features/random_quote/domain/entities/quate.dart';

List<QuoteModel> quoteModelFromJson(String str) => List<QuoteModel>.from(json.decode(str).map((x) => QuoteModel.fromJson(x)));

String quoteModelToJson(List<QuoteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: must_be_immutable
class QuoteModel extends Quote{
  int userId;
  int id;
  String title;
  String body;

  QuoteModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(userId: userId, id: id, body: body, title: title);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
