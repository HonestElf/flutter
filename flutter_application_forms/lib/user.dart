class User {
  final String id;
  final String name;
  final String userName;
  final String email;

  User(
    this.id,
    this.name,
    this.userName,
    this.email,
  );

  User.fromJson(Map<String, dynamic> json)
      : this(
          json['id'],
          json['name'],
          json['userName'],
          json['email'],
        );
}
