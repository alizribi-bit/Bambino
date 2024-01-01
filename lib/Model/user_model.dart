class User {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? dateNaissance;
  String? image;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.dateNaissance,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    dateNaissance = json['dateNaissance'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['dateNaissance'] = dateNaissance;
    data['image'] = image;
    return data;
  }
}
//get generate model on Model with assets/user.json