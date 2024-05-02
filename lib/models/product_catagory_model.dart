class ProductCategoryModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  Map<String, dynamic>? image;
  int? menuOrder;
  int? count;

  ProductCategoryModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      parent: json['parent'],
      description: json['description'],
      display: json['display'],
      image: json['image'],
      menuOrder: json['menu_order'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson(ProductCategoryModel data) {
    return {
      'id': data.id,
      'name': data.name,
      'slug': data.slug,
      'parent': data.parent,
      'description': data.description,
      'display': data.display,
      'image': data.image,
      'menu_order': data.menuOrder,
      'count': data.count
    };
  }
}
