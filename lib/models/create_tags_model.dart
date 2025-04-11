class CreateTagsModel {
  final String? name;
  final String? description;

  CreateTagsModel({this.name, this.description});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory CreateTagsModel.fromJson(Map<String, dynamic> json) {
    return CreateTagsModel(
      name: json['name'],
      description: json['description'],
    );
  }
}
