class UserModel {
  UserModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });
  late final String accessToken;
  late final String tokenType;
  late final int expiresIn;
  late final User user;

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    _data['expires_in'] = expiresIn;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.username,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.country,
    //required this.createdAt,
    //required this.updatedAt,
  });
  late final int id;
  late final String lastName;
  late final String firstName;
  late final String? username;
  late final String email;
  late final String? emailVerifiedAt;
  late final String? phone;
  late final String? birthday;
  late final String? gender;
  late final String? country;
  //late final String createdAt;
  //late final String updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['lname'];
    lastName = json['fname'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['emailVerifiedAt'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    country = json['country'];
    //createdAt = json['created_at'];
    //updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['lname'] = lastName;
    _data['fname'] = firstName;
    _data['username'] = username;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['phone'] = phone;
    _data['birthday'] = birthday;
    _data['gender'] = gender;
    _data['country'] = country;
    //_data['created_at'] = createdAt;
    //_data['updated_at'] = updatedAt;
    return _data;
  }
}
