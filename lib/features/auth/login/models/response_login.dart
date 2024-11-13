class ResponseLogin {
  final String token;

  ResponseLogin({
    required this.token,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
