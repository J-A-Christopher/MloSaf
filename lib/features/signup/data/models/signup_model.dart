class SignUpModelBody {
  SignUpModelBody(
      this.firstName, this.lastName, this.userName, this.email, this.password);
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;

  factory SignUpModelBody.fromJson(Map<String, dynamic> data) {
    return SignUpModelBody(data['fname'], data['lname'], data['username'],
        data['email'], data['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'fname': firstName,
      'lname': lastName,
      'username': userName,
      'email': email,
      'password': password
    };
  }
}
