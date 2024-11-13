class ResponseRegister {
  final int statusCode;
  final String message;
  final dynamic errorMessage;
  final dynamic data;

  ResponseRegister({
    required this.statusCode,
    required this.message,
    required this.errorMessage,
    required this.data,
  });

  factory ResponseRegister.fromJson(Map<String, dynamic> json) => ResponseRegister(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data,
      };
}
