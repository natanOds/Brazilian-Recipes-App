class Recipe {
  String title;
  String photo;
  String pork;
  String preparingTime;
  String ingredients;
  String preparationMode;

  Recipe(
      {required this.title,
        required this.photo,
        required this.pork,
        required this.preparingTime,
        required this.ingredients,
        required this.preparationMode});

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    photo = json['photo'];
    pork = json['pork'];
    preparingTime = json['preparing_time'];
    ingredients = json['Ingredients'];
    preparationMode = json['preparation_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['photo'] = this.photo;
    data['pork'] = this.pork;
    data['preparing_time'] = this.preparingTime;
    data['Ingredients'] = this.ingredients;
    data['preparation_mode'] = this.preparationMode;
    return data;
  }
}