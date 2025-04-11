// import 'package:flutter/physics.dart';

class ProductCategoryModel {
  final int? id;
  final String? name;
  final String? slug;
  final int? parent;
  final String? description;
  final String? display;
  final Image_Model? image;
  final int? menuOrder;
  final int? count;

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
      image: json['image'] != null ? Image_Model.fromJson(json['image']) : null,
      menuOrder: json['menu_order'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (slug != null) 'slug': slug,
      if (parent != null) 'parent': parent,
      'description': description,
      if (display != null) 'display': display,
      if (image != null) 'image': image,
      // if (image != null && image!.src != null) 'image': toJson() != image,
      if (menuOrder != null) 'menu_order': menuOrder,
      if (count != null) 'count': count
    };
  }
}

class Image_Model {
  final int? id;
  final String? src;
  final String? name;
  final String? alt;

  Image_Model({
    this.id,
    this.src,
    this.name,
    this.alt,
  });

  factory Image_Model.fromJson(Map<String, dynamic> json) {
    return Image_Model(
        id: json['id'], src: json['src'], name: json['name'], alt: json['alt']);
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'src': src,
      if (name != null) 'name': name,
      if (alt != null) 'alt': alt,
    };
  }
}
