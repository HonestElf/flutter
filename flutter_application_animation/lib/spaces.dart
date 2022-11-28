class Space {
  final String id;
  final String image;
  final String description;

  Space({required this.id, required this.image, required this.description});
}

final List<Space> spacesList = [
  Space(
      id: '1',
      image: 'assets/images/space1.png',
      description: 'Lorem ipsum dolor sit amet, consectet'),
  Space(
      id: '2',
      image: 'assets/images/space2.jpg',
      description: 'Excepteur sint occaecat cupidatat non proiden'),
  Space(
      id: '3',
      image: 'assets/images/space3.jpg',
      description:
          'rud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint oc'),
  Space(
      id: '4',
      image: 'assets/images/space4.jpg',
      description: 'tatis et quasi architecto '),
  Space(
      id: '5',
      image: 'assets/images/space5.jpg',
      description:
          'eniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea volu'),
  Space(
      id: '6',
      image: 'assets/images/space6.jpg',
      description: 'But I must explain to you how all this mistaken idea'),
];
