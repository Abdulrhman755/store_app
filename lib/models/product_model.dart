class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final RatingModel? rating;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      description: json['description'] as String,
      price: double.parse(json['price'].toString()),
      imageUrl: json['image'] as String,
      rating:
          json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
      category: json['category'] as String,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: double.parse(json['rate'].toString()),
      count: int.parse(json['count'].toString()),  
    );
  }
}