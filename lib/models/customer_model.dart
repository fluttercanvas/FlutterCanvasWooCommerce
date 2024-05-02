class CustomerModel {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  String? username;
  String? password;
  Map<String, dynamic>? billing;
  Map<String, dynamic>? shipping;
  bool? isPayingCustomer;
  String? avatarUrl;
  List<dynamic>? metaData;

  CustomerModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.username,
    this.password,
    this.billing,
    this.shipping,
    this.isPayingCustomer,
    this.avatarUrl,
    this.metaData,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      dateCreated: DateTime.parse(json['date_created']),
      dateCreatedGmt: DateTime.parse(json['date_created_gmt']),
      dateModified: DateTime.parse(json['date_modified']),
      dateModifiedGmt: DateTime.parse(json['date_modified_gmt']),
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      role: json['role'],
      username: json['username'],
      password: json['password'],
      billing: json['billing'],
      shipping: json['shipping'],
      isPayingCustomer: json['is_paying_customer'],
      avatarUrl: json['avatar_url'],
      metaData: json['meta_data'],
    );
  }

  Map<String, dynamic> toMap(CustomerModel e) {
    return {
      "id": e.id,
      "date_created": e.dateCreated,
      "date_created_gmt": e.dateCreatedGmt,
      "date_modified": e.dateModified,
      "date_modified_gmt": e.dateModifiedGmt,
      "email": e.email,
      "first_name": e.firstName,
      "last_name": e.lastName,
      "role": e.role,
      "username": e.username,
      "billing": e.billing,
      "shipping": e.shipping,
      "is_paying_customer": e.isPayingCustomer,
      "avatar_url": e.avatarUrl,
      "meta_data": e.metaData,
    };
  }
}
