class Users {
  String uid;
  Users({this.uid});
}

class UserData {
  String name;
  String email;

  UserData({
    this.name,
    this.email,
  });

  factory UserData.fromDatabase(Map<String, dynamic> data) {
    return UserData(
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'name': name,
      'email': email,
    };
  }

  String getMail() {
    return email;
  }
}
