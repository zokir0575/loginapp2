class User{
  String name;
  String email;
  String password;

  User({ this.name,  this.email,  this.password});
  User.from({ this.email, this.password, this.name });



  User.fromJson(Map<String, dynamic> json)
      :name  = json['name'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password' : password,
  };
}