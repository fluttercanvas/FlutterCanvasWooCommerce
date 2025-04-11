// ignore_for_file: non_constant_identifier_names

class ProductAttributeTermsModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final int? menu_order;
  final int? count;
  final int? attributes_id;

  ProductAttributeTermsModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.menu_order,
    this.count,
    this.attributes_id,
  });

  factory ProductAttributeTermsModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeTermsModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        description: json['description'],
        menu_order: json['menu_order'],
        count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (slug != null) 'slug': slug,
      'description': description,
      if (menu_order != null) 'menu_order': menu_order,
      if (count != null) 'count': count,
    };
  }
}
