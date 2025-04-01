// ignore_for_file: non_constant_identifier_names

class ProductAttriduteModel {
  int? id;
  String? name;
  String? slug;
  String? type;
  String? order_by;
  bool? has_archives;

  ProductAttriduteModel({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.order_by,
    this.has_archives,
  });

  factory ProductAttriduteModel.fromJson(Map<String, dynamic> json) {
    return ProductAttriduteModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      type: json['type'],
      order_by: json['order_by'],
      has_archives: json['has_archives'],
    );
  }

  Map<String, dynamic> toJson(ProductAttriduteModel data) {
    return {
      'id': data.id,
      'name': data.name,
      'slug': data.slug,
      'type': data.type,
      'order_by': data.order_by,
      'has_archives': data.has_archives,
    };
  }
}
