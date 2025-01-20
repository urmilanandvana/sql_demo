class ProductModel {
  var id;
  var name;
  var image;
  var price;
  var rating;
  var likeStatus;
  var createdAt;
  var updatedAt;
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.likeStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  factory ProductModel.fromJson(Map<String, dynamic> josn) {
    return ProductModel(
      id: josn['id'],
      name: josn['name'],
      image: josn['image'],
      price: josn['price'],
      rating: josn['rating'],
      likeStatus: josn['likeStatus'],
      createdAt: josn['created_at'],
      updatedAt: josn['updated_at'],
    );
  }
}
