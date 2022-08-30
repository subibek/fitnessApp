
class Users{
  String username;
  String email;
  String password;

  Users({
    required this.password,
    required this.username,
    required this.email
});

  Map<String, dynamic> toJson() => {
    'username' : username,
    'email' : email,
    'password' : password
  };
}