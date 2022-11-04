class SignUpModel {
  final String name;
  final String email;
  final String password;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
