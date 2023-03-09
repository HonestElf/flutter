import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/entity/entity_user.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.user,
      required this.cardNumber,
      required this.deleteUser,
      required this.editUser});
  final User user;

  final Function deleteUser;
  final Function editUser;

  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.blue.shade200,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text('${user.firstName} ${user.secondName} ${user.age}'),
        subtitle: Text('${user.phone} $cardNumber'),
        leading: Text('${user.id}'),
        trailing: SizedBox(
          width: 100,
          child: Row(children: [
            IconButton(
                onPressed: () {
                  editUser(user, cardNumber);
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  deleteUser(user);
                },
                icon: const Icon(Icons.delete))
          ]),
        ),
      ),
    );
  }
}
