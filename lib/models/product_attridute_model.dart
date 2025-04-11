// ignore_for_file: non_constant_identifier_names

class ProductAttributeModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? type;
  final String? order_by;
  final bool? has_archives;

  ProductAttributeModel({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.order_by,
    this.has_archives,
  });

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    return ProductAttributeModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      type: json['type'],
      order_by: json['order_by'],
      has_archives: json['has_archives'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (slug != null) 'slug': slug,
      if (type != null) 'type': type,
      if (order_by != null) 'order_by': order_by,
      if (has_archives != null) 'has_archives': has_archives,
    };
  }
}
