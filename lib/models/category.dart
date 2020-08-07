class Category{
  final String id, title, image;
  final int numOfProducts;

  Category({this.id, this.title, this.image, this.numOfProducts});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }
}

Category category = Category(
  id: "1",
  title: "Armchair",
  image: "http://192.168.30.39/1.png",
  numOfProducts: 100,
);