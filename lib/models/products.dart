class ProductsModel {
  final String id;
  final String title;
  final String image;
  final int price;
  final String category;
  final String subtitle;
  final String desc;
  final DateTime? date;
 ProductsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.category,
    required this.subtitle,
    required this.desc,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  factory ProductsModel.fromjson(jsonData) {
    return ProductsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      image: jsonData['image'],
      price: jsonData['price'],
      category: jsonData['category'],
      subtitle: jsonData['subTitle'],
      desc: jsonData['description'],
    );
  }
}
