class CategoriesModel {
  final String id;
  final String image;
  final String title;
  final int numOfProducts;

  CategoriesModel(
      {required this.id,required this.image, required this.title, required this.numOfProducts});

  factory CategoriesModel.fromjson(jsonData) {
    return CategoriesModel(
        id :jsonData['id'],
        image: jsonData['image'],
        title: jsonData['title'],
        numOfProducts: jsonData['numOfProducts']);
  }
}
