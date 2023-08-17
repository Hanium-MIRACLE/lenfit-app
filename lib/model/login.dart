class Login {
  final String email;
  final String password;
  final String token;

  Login(
    this.email,
    this.password,
    this.token,
  );

  Login.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'token': token,
      };
}
