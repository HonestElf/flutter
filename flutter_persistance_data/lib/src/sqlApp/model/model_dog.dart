class Dog {
  final int id;
  final String name;
  final int age;

  Dog({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'age': age};

  @override
  String toString() => 'Dog{id: $id, name: $name, age: $age}';
}
