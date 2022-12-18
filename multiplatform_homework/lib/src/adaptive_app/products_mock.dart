class Product {
  final String title;
  final String type;
  final String description;
  final double price;
  final int rating;
  final String image;

  Product(
      {required this.title,
      required this.type,
      required this.description,
      required this.price,
      required this.rating,
      required this.image});
}

final List<Product> products = _rawProducts
    .map((product) => Product(
        title: product["title"],
        type: product["type"],
        description: product["description"],
        price: product["price"],
        rating: product["rating"],
        image: product["imagePath"]))
    .toList();

final List<Map<String, dynamic>> _rawProducts = [
  {
    "title": "Hades",
    "type": "rogue-like",
    "description":
        "Бросьте вызов богу мёртвых и прорубите себе путь из Подземного мира в игре в жанрах «рогалик» и «данжен-кроулер» от создателей Bastion, Transistor и Pyre.",
    "imagePath": "assets/images/item1.png",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 5,
  },
  {
    "title": "Dead cells",
    "type": "rogue-like",
    "description":
        "Dead Cells — это экшн-платформер в жанре Rogue-lite и Metroidvania. Вас ждет огромный, постоянно меняющийся замок... Если, конечно, вы сможете победить тех, кто встанет у вас на пути, в 2D-схватках в стиле Souls-lite. Без сохранений. Убивайте, умирайте, учитесь и пробуйте снова.",
    "imagePath": "assets/images/item2.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "Metal Gear",
    "type": "action-adventure",
    "description":
        "Metal Gear (яп. メタルギア Мэтару Гиа) — видеоигра, разработанная дизайнером Хидэо Кодзимой и изданная студией Konami в 1987 году для домашних компьютеров стандарта MSX2",
    "imagePath": "assets/images/item3.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "Metal Gear Rising",
    "type": "hack and slash",
    "description":
        "Developed by Kojima Productions and PlatinumGames, METAL GEAR RISING: REVENGEANCE takes the renowned METAL GEAR franchise into exciting new territory with an all-new action experience. The game seamlessly melds pure action and epic story-telling that surrounds Raiden",
    "imagePath": "assets/images/item4.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "Dawn of War",
    "type": "RTS",
    "description":
        "Warhammer 40,000: Dawn of War — компьютерная игра, стратегия в реальном времени, разработанная студией Relic Entertainment на основе настольного варгейма Warhammer 40,000 студии Games Workshop. Издана в 2004 году компанией THQ",
    "imagePath": "assets/images/item5.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "Persona 5",
    "type": "JRPG",
    "description":
        "Persona 5 — компьютерная ролевая игра, созданная студией P-Studio, входящей в состав японской компании Atlus.",
    "imagePath": "assets/images/item6.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "Persona 4",
    "type": "JRPG",
    "description":
        "Persona 4,[a] released outside of Japan as Shin Megami Tensei: Persona 4, is a role-playing video game by Atlus. It is chronologically the fifth installment in the Persona series, itself a part of the larger Megami Tensei franchise",
    "imagePath": "assets/images/item7.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "Gears of War",
    "type": "TPS",
    "description":
        "Gears of War — серия компьютерных игр в жанре шутера от третьего лица, издаваемых Xbox Game Studios для игровых приставок семейства Xbox и персональных компьютеров под управлением Windows",
    "imagePath": "assets/images/item8.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "God of War",
    "type": "action",
    "description":
        "God of War (с англ. — «Бог войны») — компьютерная игра в жанре action-adventure, разработанная компанией SIE Santa Monica Studio и изданная Sony Interactive Entertainment для игровой консоли PlayStation 4. ",
    "imagePath": "assets/images/item9.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
  {
    "title": "God of War: Ghost of Sparta",
    "type": "action",
    "description":
        "God of War: Ghost of Sparta, в России издана под названием God of War: Призрак Спарты — игра в жанре action от третьего лица для PlayStation Portable, основана на греческих мифах.s",
    "imagePath": "assets/images/item10.jpg",
    "height": 400,
    "width": 300,
    "price": 29.45,
    "rating": 4,
  },
];
