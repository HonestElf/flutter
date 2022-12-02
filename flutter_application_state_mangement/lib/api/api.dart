Future<List<Map<String, dynamic>>> getItems() async {
  await Future.delayed(const Duration(seconds: 2));

  return gamesList;
}

List<Map<String, dynamic>> gamesList = [
  {
    'id': 1,
    'name': 'Hades',
    'image': 'item1.png',
  },
  {
    'id': 2,
    'name': 'Dead cells',
    'image': 'item2.jpg',
  },
  {
    'id': 3,
    'name': 'Metal Gear',
    'image': 'item3.jpg',
  },
  {
    'id': 4,
    'name': 'Metal Gear Rising',
    'image': 'item4.jpg',
  },
  {
    'id': 5,
    'name': 'Dawn of War',
    'image': 'item5.jpg',
  },
  {
    'id': 6,
    'name': 'Persona 5',
    'image': 'item6.jpg',
  },
  {
    'id': 7,
    'name': 'Persona 4',
    'image': 'item7.jpg',
  },
  {
    'id': 8,
    'name': 'Gears of War',
    'image': 'item8.jpg',
  },
  {
    'id': 9,
    'name': 'God of War',
    'image': 'item9.jpg',
  },
  {
    'id': 10,
    'name': 'God of War: Ghost of Sparta',
    'image': 'item10.jpg',
  },
];
