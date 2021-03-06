class DrinkModel {
  DrinkModel({
    required this.drinks,
  });
  late final List<Drinks> drinks;
  
  DrinkModel.fromJson(Map<String, dynamic> json){
    drinks = List.from(json['drinks']).map((e)=>Drinks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['drinks'] = drinks.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Drinks {
  Drinks({
    required this.idDrink,
    required this.strDrink,
     this.strDrinkAlternate,
     this.strTags,
    required this.strVideo,
    required this.strCategory,
    required this.strIBA,
    required this.strAlcoholic,
    required this.strGlass,
    required this.strInstructions,
     this.strInstructionsES,
    required this.strInstructionsDE,
     this.strInstructionsFR,
    required this.strInstructionsIT,
    //  this.strInstructionsZH-HANS,
     this.strInstructionsZH,
    required this.strDrinkThumb,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
     this.strIngredient4,
     this.strIngredient5,
     this.strIngredient6,
     this.strIngredient7,
     this.strIngredient8,
     this.strIngredient9,
     this.strIngredient10,
     this.strIngredient11,
     this.strIngredient12,
     this.strIngredient13,
     this.strIngredient14,
     this.strIngredient15,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
     this.strMeasure4,
     this.strMeasure5,
     this.strMeasure6,
     this.strMeasure7,
     this.strMeasure8,
     this.strMeasure9,
     this.strMeasure10,
     this.strMeasure11,
     this.strMeasure12,
     this.strMeasure13,
     this.strMeasure14,
     this.strMeasure15,
     this.strImageSource,
     this.strImageAttribution,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });
  late final String? idDrink;
  late final String? strDrink;
  late final dynamic strDrinkAlternate;
  late final dynamic strTags;
  late final String? strVideo;
  late final String? strCategory;
  late final String? strIBA;
  late final String? strAlcoholic;
  late final String? strGlass;
  late final String? strInstructions;
  late final dynamic strInstructionsES;
  late final String? strInstructionsDE;
  late final dynamic strInstructionsFR;
  late final String? strInstructionsIT;
  late final dynamic strInstructionsZH;
  late final String? strDrinkThumb;
  late final String? strIngredient1;
  late final String? strIngredient2;
  late final String? strIngredient3;
  late final dynamic strIngredient4;
  late final dynamic strIngredient5;
  late final dynamic strIngredient6;
  late final dynamic strIngredient7;
  late final dynamic strIngredient8;
  late final dynamic strIngredient9;
  late final dynamic strIngredient10;
  late final dynamic strIngredient11;
  late final dynamic strIngredient12;
  late final dynamic strIngredient13;
  late final dynamic strIngredient14;
  late final dynamic strIngredient15;
  late final String? strMeasure1;
  late final String? strMeasure2;
  late final String? strMeasure3;
  late final dynamic strMeasure4;
  late final dynamic strMeasure5;
  late final dynamic strMeasure6;
  late final dynamic strMeasure7;
  late final dynamic strMeasure8;
  late final dynamic strMeasure9;
  late final dynamic strMeasure10;
  late final dynamic strMeasure11;
  late final dynamic strMeasure12;
  late final dynamic strMeasure13;
  late final dynamic strMeasure14;
  late final dynamic strMeasure15;
  late final dynamic strImageSource;
  late final dynamic strImageAttribution;
  late final String? strCreativeCommonsConfirmed;
  late final String? dateModified;
  
  Drinks.fromJson(Map<String, dynamic> json){
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkAlternate = null;
    strTags = null;
    strVideo = json['strVideo'];
    strCategory = json['strCategory'];
    strIBA = json['strIBA'];
    strAlcoholic = json['strAlcoholic'];
    strGlass = json['strGlass'];
    strInstructions = json['strInstructions'];
    strInstructionsES = null;
    strInstructionsDE = json['strInstructionsDE'];
    strInstructionsFR = null;
    strInstructionsIT = json['strInstructionsIT'];
    strInstructionsZH = null;
    strDrinkThumb = json['strDrinkThumb'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = null;
    strIngredient5 = null;
    strIngredient6 = null;
    strIngredient7 = null;
    strIngredient8 = null;
    strIngredient9 = null;
    strIngredient10 = null;
    strIngredient11 = null;
    strIngredient12 = null;
    strIngredient13 = null;
    strIngredient14 = null;
    strIngredient15 = null;
    strMeasure1 = json['strMeasure1'];
    strMeasure2 = json['strMeasure2'];
    strMeasure3 = json['strMeasure3'];
    strMeasure4 = null;
    strMeasure5 = null;
    strMeasure6 = null;
    strMeasure7 = null;
    strMeasure8 = null;
    strMeasure9 = null;
    strMeasure10 = null;
    strMeasure11 = null;
    strMeasure12 = null;
    strMeasure13 = null;
    strMeasure14 = null;
    strMeasure15 = null;
    strImageSource = null;
    strImageAttribution = null;
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idDrink'] = idDrink;
    _data['strDrink'] = strDrink;
    _data['strDrinkAlternate'] = strDrinkAlternate;
    _data['strTags'] = strTags;
    _data['strVideo'] = strVideo;
    _data['strCategory'] = strCategory;
    _data['strIBA'] = strIBA;
    _data['strAlcoholic'] = strAlcoholic;
    _data['strGlass'] = strGlass;
    _data['strInstructions'] = strInstructions;
    _data['strInstructionsES'] = strInstructionsES;
    _data['strInstructionsDE'] = strInstructionsDE;
    _data['strInstructionsFR'] = strInstructionsFR;
    _data['strInstructionsIT'] = strInstructionsIT;
    _data['strInstructionsZH-HANS'] = strInstructionsZH;
    _data['strInstructionsZH-HANT'] = strInstructionsZH;
    _data['strDrinkThumb'] = strDrinkThumb;
    _data['strIngredient1'] = strIngredient1;
    _data['strIngredient2'] = strIngredient2;
    _data['strIngredient3'] = strIngredient3;
    _data['strIngredient4'] = strIngredient4;
    _data['strIngredient5'] = strIngredient5;
    _data['strIngredient6'] = strIngredient6;
    _data['strIngredient7'] = strIngredient7;
    _data['strIngredient8'] = strIngredient8;
    _data['strIngredient9'] = strIngredient9;
    _data['strIngredient10'] = strIngredient10;
    _data['strIngredient11'] = strIngredient11;
    _data['strIngredient12'] = strIngredient12;
    _data['strIngredient13'] = strIngredient13;
    _data['strIngredient14'] = strIngredient14;
    _data['strIngredient15'] = strIngredient15;
    _data['strMeasure1'] = strMeasure1;
    _data['strMeasure2'] = strMeasure2;
    _data['strMeasure3'] = strMeasure3;
    _data['strMeasure4'] = strMeasure4;
    _data['strMeasure5'] = strMeasure5;
    _data['strMeasure6'] = strMeasure6;
    _data['strMeasure7'] = strMeasure7;
    _data['strMeasure8'] = strMeasure8;
    _data['strMeasure9'] = strMeasure9;
    _data['strMeasure10'] = strMeasure10;
    _data['strMeasure11'] = strMeasure11;
    _data['strMeasure12'] = strMeasure12;
    _data['strMeasure13'] = strMeasure13;
    _data['strMeasure14'] = strMeasure14;
    _data['strMeasure15'] = strMeasure15;
    _data['strImageSource'] = strImageSource;
    _data['strImageAttribution'] = strImageAttribution;
    _data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    _data['dateModified'] = dateModified;
    return _data;
  }
}