class ListUserModel {
  final List<UserModel>? users;

  const ListUserModel({
    this.users,
  });

  factory ListUserModel.fromJson(List<dynamic> json) {
    return ListUserModel(
        users: json.map((json) => UserModel.fromJson(json)).toList());
  }
}

class UserModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final email = json['email'];
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final avatar = json['avatar'];

    return UserModel(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}
