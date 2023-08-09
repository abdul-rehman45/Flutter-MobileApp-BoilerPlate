class UserModel {
  User? user;

  String? token;

  UserModel({this.user, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? image;
  String? userType;
  bool? isPolicy;
  String? role;
  String? createdDateTime;
  String? modifiedDateTime;
  bool? isActive;
  bool? isDeleted;

  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.image,
      this.userType,
      this.isPolicy,
      this.role,
      this.createdDateTime,
      this.modifiedDateTime,
      this.isActive,
      this.isDeleted});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    userType = json['userType'];
    isPolicy = json['isPolicy'];
    role = json['role'];
    createdDateTime = json['createdDateTime'];
    modifiedDateTime = json['modifiedDateTime'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['userType'] = userType;
    data['isPolicy'] = isPolicy;
    data['role'] = role;
    data['createdDateTime'] = createdDateTime;
    data['modifiedDateTime'] = modifiedDateTime;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
