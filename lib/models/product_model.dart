class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;

  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'],
      title: jsonData['title'],
      category: jsonData['category'],
      rating: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({
    required this.count,
    required this.rate,
  });
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      count: jsonData['count'],
      rate: jsonData['rate'],
    );
  }
}
