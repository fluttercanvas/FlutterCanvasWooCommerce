class ShippingZoneModel {
  int? id;
  String? name;
  int? order;
  dynamic links;

  ShippingZoneModel({this.id, this.name, this.order, this.links});

  ShippingZoneModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    links = json['_links'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    if (links != null) {
      data['_links'] = links!.toJson();
    }
    return data;
  }
}
