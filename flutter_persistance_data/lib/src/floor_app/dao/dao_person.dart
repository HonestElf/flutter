import 'package:floor/floor.dart';
import 'package:flutter_persistance_data/src/floor_app/entities/entity_person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPerson(Person person);
}
