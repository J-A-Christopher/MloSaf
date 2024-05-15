class LoginBody {
  LoginBody({required this.email, required this.password});
  final String email;
  final String password;

  factory LoginBody.fromJson(Map<String, dynamic> json) {
    return LoginBody(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, "password": password};
  }
}
