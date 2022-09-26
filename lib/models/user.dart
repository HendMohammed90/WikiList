class User {
  int id;
  String firstName, lastName, email, img;
  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.img});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        img: json['avatar']);
  }
}
