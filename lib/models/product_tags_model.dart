// ignore_for_file: non_constant_identifier_names

class ProductTagsModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? count;

  ProductTagsModel(
      {this.id, this.name, this.slug, this.description, this.count});

  factory ProductTagsModel.fromJson(Map<String, dynamic> json) {
    return ProductTagsModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson(ProductTagsModel data) {
    return {
      'id': data.id,
      'name': data.name,
      'slug': data.slug,
      'description': data.description,
      'count': data.count,
    };
  }
}
