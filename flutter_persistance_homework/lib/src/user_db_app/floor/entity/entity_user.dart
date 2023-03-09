import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int id;

  final String firstName;
  final String secondName;
  final int age;
  final String phone;

  User({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.age,
    required this.phone,
  });
}
