// ignore_for_file: non_constant_identifier_names

class ProductAttributeTermsModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? menu_order;
  int? count;

  ProductAttributeTermsModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    required menu_order,
    this.count,
  });

  factory ProductAttributeTermsModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeTermsModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      menu_order: json['menu_order'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson(ProductAttributeTermsModel data) {
    return {
      'id': data.id,
      'name': data.name,
      'slug': data.slug,
      'description': data.description,
      'menu_order': data.menu_order,
      'count': data.count,
    };
  }
}
