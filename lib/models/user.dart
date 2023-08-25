class User {
  final String? id;
  final String name;
  final String cpf;
  final String birthdate;
  final bool? admin;
  final String? email;
  final String? phone;
  final bool? member;
  final String? createdAt;
  final String? updatedAt;
  final String? token;

  User({
    this.id,
    required this.name,
    required this.cpf,
    required this.birthdate,
    this.admin,
    this.email,
    this.phone,
    this.member,
    this.createdAt,
    this.updatedAt,
    this.token
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      cpf = json['cpf'],
      birthdate = json['birthdate'],
      admin = json['admin'],
      email = json['email'],
      phone = json['phone'],
      member = json['member'],
      createdAt = json['createdAt'],
      updatedAt = json['updatedAt'],
      token = json['token'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'name': name,
      'cpf': cpf,
      'birthdate': birthdate,
      'admin': admin,
      'email': email,
      'phone': phone,
      'member': member,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'token': token,
    };
}
