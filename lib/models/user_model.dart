class UserModel {
  late String name;
  late String email;
  late int id;
  late String token;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'token': token,
    };
  }
}
