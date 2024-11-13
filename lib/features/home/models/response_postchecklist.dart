class ResponsePostChecklist {
  final int statusCode;
  final String message;
  final dynamic errorMessage;
  final Data data;

  ResponsePostChecklist({
    required this.statusCode,
    required this.message,
    required this.errorMessage,
    required this.data,
  });

  factory ResponsePostChecklist.fromJson(Map<String, dynamic> json) => ResponsePostChecklist(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final String name;
  final dynamic items;
  final bool checklistCompletionStatus;

  Data({
    required this.id,
    required this.name,
    required this.items,
    required this.checklistCompletionStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        items: json["items"],
        checklistCompletionStatus: json["checklistCompletionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": items,
        "checklistCompletionStatus": checklistCompletionStatus,
      };
}
