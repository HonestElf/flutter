import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int id;

  final String firstName;
  final String secondName;
  final int age;
  final String phone;
  final String cardNumber;

  User(this.id, this.firstName, this.secondName, this.age, this.phone,
      this.cardNumber);
}
