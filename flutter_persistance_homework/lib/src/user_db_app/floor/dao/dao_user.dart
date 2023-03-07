import 'package:floor/floor.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/entity/entity_user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * from User')
  Future<List<User>> getAllUsers();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<User?> getUserById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addUser(User user);

  @delete
  Future<void> deleteUser(User user);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(User user);
}
