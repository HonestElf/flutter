import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String firstName;
  final String secondName;
  final int age;
  final String phone;
  final String cardNumber;

  User(
      {this.id,
      required this.firstName,
      required this.secondName,
      required this.age,
      required this.phone,
      required this.cardNumber});
}
