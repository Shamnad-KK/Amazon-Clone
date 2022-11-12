class UserModel {
  final String? name;
  final String? email;
  final String? password;
  final String? id;
  final String? address;
  final String? type;
  final String? token;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.address,
    required this.type,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      id: json["_id"] ?? "",
      address: json["address"] ?? "",
      token: json["token"] ?? "",
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "_id": id,
      "address": address,
      "type": type,
      "token": token,
    };
  }
}
