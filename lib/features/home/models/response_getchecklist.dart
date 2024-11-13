// To parse this JSON data, do
//
//     final responseGetChecklist = responseGetChecklistFromJson(jsonString);

import 'dart:convert';

ResponseGetChecklist responseGetChecklistFromJson(String str) => ResponseGetChecklist.fromJson(json.decode(str));

String responseGetChecklistToJson(ResponseGetChecklist data) => json.encode(data.toJson());

class ResponseGetChecklist {
  final int? statusCode;
  final String? message;
  final dynamic errorMessage;
  final List<Datum>? data;

  ResponseGetChecklist({
    this.statusCode,
    this.message,
    this.errorMessage,
    this.data,
  });

  factory ResponseGetChecklist.fromJson(Map<String, dynamic> json) => ResponseGetChecklist(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? name;
  final List<Item>? items;
  final bool? checklistCompletionStatus;

  Datum({
    this.id,
    this.name,
    this.items,
    this.checklistCompletionStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        checklistCompletionStatus: json["checklistCompletionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "checklistCompletionStatus": checklistCompletionStatus,
      };
}

class Item {
  final int? id;
  final String? name;
  final bool? itemCompletionStatus;

  Item({
    this.id,
    this.name,
    this.itemCompletionStatus,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        itemCompletionStatus: json["itemCompletionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "itemCompletionStatus": itemCompletionStatus,
      };
}
