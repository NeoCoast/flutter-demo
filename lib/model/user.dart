class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String profileImage;
  String birthdate;

  User();

  User.fromParams(this.id, this.email, this.profileImage, this.birthdate, this.firstName, this.lastName);

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      email = json['email'],
      firstName = json['first_name'],
      lastName = json['last_name'],
      profileImage = json['profile_image']['url'],
      birthdate = json['birthdate'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'birthdate': birthdate,
    'profile_image': {
      'url': profileImage,
    },
  };

  @override
  String toString() {
    return "$id - $firstName - $lastName - $email";
  }
}
