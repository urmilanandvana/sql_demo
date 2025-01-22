class ProductModel {
  var id;
  var name;
  var image;
  var price;
  var rating;
  var likeStatus;
  var createdAt;
  var updatedAt;
  var quantity;
  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.rating,
    this.likeStatus,
    this.createdAt,
    this.updatedAt,
    this.quantity,
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
      quantity: josn['quantity'],
    );
  }
}
