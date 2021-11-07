final String tableUsers = 'users';

class UserFields {
  static final List<String> values = [id, username, email, password,
    phoneNumber];

  static final String id = '_id';
  static final String username = 'username';
  static final String email = 'email';
  static final String password = 'password';
  static final String phoneNumber = 'phoneNumber';
}

class User {
  final int id;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;

  const User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.phoneNumber});

  User copy({
    int id,
    String username,
    String email,
    String password,
    String phoneNumber}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  static User fromJson(Map<String, Object> json) {
    return User(id: json[UserFields.id] as int,
    username: json[UserFields.username] as String,
    email: json[UserFields.email] as String,
    password: json[UserFields.password] as String,
    phoneNumber: json[UserFields.phoneNumber] as String,);
  }

  Map<String, Object> toJson() => {
    UserFields.id: id,
    UserFields.username: username,
    UserFields.email: email,
    UserFields.password: password,
    UserFields.phoneNumber: phoneNumber,
  };
}