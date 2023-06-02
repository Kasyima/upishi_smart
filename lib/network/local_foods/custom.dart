import 'dart:convert';

class CustomFoods {
  final String title;
  final String imageUrl;
  final String description;
  final int totalTime;
// 1.
  CustomFoods._({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.totalTime,
  });
// 2.
  factory CustomFoods.fromJson(Map<String, dynamic> json) => CustomFoods._(
      title: json["title"],
      imageUrl: json["imageUrl"],
      description: json['description'],
      totalTime: json['totalTime']);
// 3.
  Map<String, dynamic> toJson() => {
        "title": title,
        "imageUrl": imageUrl,
        "description": description,
        "totalTime": totalTime
      };
}

class networkCustom {
  final String customFoods = '''[
  {
    "title": "mutura",
    "imageUrl":
        "https://misskabaki.co.ke/wp-content/uploads/2021/12/Mutura-10-1280x960.jpg",
    "description":
        "Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.",
    "totalTime": 60
  },
  {
    "title": "githeri",
    "imageUrl":"https://weeatatlast.com/wp-content/uploads/2022/01/best-githeri-recipe.jpg",
    "description":
        "Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.",
    "totalTime": 65
  },
  {
    "title": "mukimo",
    "imageUrl":"https://img-global.cpcdn.com/recipes/175205ad5a70f38c/1360x964cq70/mashed-potatoes-mukimo-recipe-main-photo.webp",
    "description": "Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.",
    "totalTime": 50
  },
  {
    "title": "ugali",
    "imageUrl":
        "https://mayuris-jikoni.com/wp-content/uploads/2012/10/ugali-new-2-copy.jpg",
    "description":
        "Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo. Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.",
    "totalTime": 60
  },
  {
    "title": "mutura",
    "imageUrl":
        "https://misskabaki.co.ke/wp-content/uploads/2021/12/Mutura-10-1280x960.jpg",
    "description":
        "Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.",
    "totalTime": 60
  },
  {
    "title": "githeri",
    "imageUrl":"https://weeatatlast.com/wp-content/uploads/2022/01/best-githeri-recipe.jpg",
    "description":
        "Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.",
    "totalTime": 65
  },
  {
    "title": "mukimo",
    "imageUrl":"https://img-global.cpcdn.com/recipes/175205ad5a70f38c/1360x964cq70/mashed-potatoes-mukimo-recipe-main-photo.webp",
    "description": "Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.",
    "totalTime": 50
  },
  {
    "title": "ugali",
    "imageUrl":
        "https://mayuris-jikoni.com/wp-content/uploads/2012/10/ugali-new-2-copy.jpg",
    "description":
        "Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.",
    "totalTime": 60
  },
  {
    "title": "mutura",
    "imageUrl":
        "https://misskabaki.co.ke/wp-content/uploads/2021/12/Mutura-10-1280x960.jpg",
    "description":
        "Mutura is a Kenyan popular meal prepared on the streets and in ceremonies. It is prepared from livestock blood and intestines. The intestines are tied at one end and blood is added and spices are added and then it is boiled for sixty minutes.",
    "totalTime": 60
  },
  {
    "title": "githeri",
    "imageUrl":"https://weeatatlast.com/wp-content/uploads/2022/01/best-githeri-recipe.jpg",
    "description":
        "Githeri is a corn and bean one pot meal which originated from the Kikuyu tribe of Kenya. It is also known as muthere or mutheri.",
    "totalTime": 65
  },
  {
    "title": "mukimo",
    "imageUrl":"https://img-global.cpcdn.com/recipes/175205ad5a70f38c/1360x964cq70/mashed-potatoes-mukimo-recipe-main-photo.webp",
    "description": "Mukimo is a meal whose origin is Central Kenya (Agikuyu community) but it's being served in hotels across the country.",
    "totalTime": 50
  },
  {
    "title": "ugali",
    "imageUrl":
        "https://mayuris-jikoni.com/wp-content/uploads/2012/10/ugali-new-2-copy.jpg",
    "description":
        "Ugali ni chakula kinacholiwa na jamii za kiafrika. Chakula hiki chenye virutubisho vya wanga hutokana na unga wa nafaka au muhogo.",
    "totalTime": 60
  }
]''';

  List<CustomFoods> getCustomFoods() {
    List<dynamic> jsonList = jsonDecode(customFoods);
    final List<CustomFoods> customfoods =
        jsonList.map((value) => CustomFoods.fromJson(value)).toList();

    return customfoods;
  }
}
