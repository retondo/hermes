class User {
  String id;
  String name;
  String cpf;
  String email;
  String phone;
  String birthdate;
  bool member;
  bool admin;
  String createdAt;
  String updatedAt;
  String token;

  User({
    this.id,
    this.name,
    this.cpf,
    this.email,
    this.phone,
    this.birthdate,
    this.member,
    this.createdAt,
    this.updatedAt,
    this.token
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      birthdate: json['birthdate'],
      member: json['member'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      token: json['token'],
    );
  }
}
