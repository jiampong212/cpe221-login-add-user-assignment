class User {
  String userID;
  String userName;
  String firstName;
  String lastName;
  String password;
  User({
    required this.userID,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  User.empty()
      : userID = '',
        userName = '',
        firstName = '',
        lastName = '',
        password = '';
}
