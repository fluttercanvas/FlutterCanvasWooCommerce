// ignore_for_file: non_constant_identifier_names

class ProductTagsModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final int? count;

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
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (slug != null) 'slug': slug,
      'description': description,
      if (count != null) 'count': count,
    };
  }
}
