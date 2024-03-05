class UserModel {
  final int id;
  final String fname;
  final String lname;
  final String email;
  final String password;
  final int departmentId;
  final String role;

  UserModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.departmentId,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
      password: json['password'],
      departmentId: json['department_id'],
      role: json['role'],
    );
  }
}
