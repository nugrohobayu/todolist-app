
class RequestRegister {
  final String email;
  final String password;
  final String username;

  RequestRegister({
    required this.email,
    required this.password,
    required this.username,
  });

  factory RequestRegister.fromJson(Map<String, dynamic> json) => RequestRegister(
    email: json["email"],
    password: json["password"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "username": username,
  };
}
