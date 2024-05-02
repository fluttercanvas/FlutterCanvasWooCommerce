class CouponModel {
  int? id;
  String? code;
  String? amount;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? discountType;
  String? description;
  String? dateExpires;
  String? dateExpiresGmt;
  int? usageCount;
  bool? individualUse;
  List<int>? productIds;
  List<int>? excludedProductIds;
  int? usageLimit;
  int? usageLimitPerUser;
  int? limitUsageToXItems;
  bool? freeShipping;
  List<int>? productCategories;
  List<int>? excludedProductCategories;
  bool? excludeSaleItems;
  String? minimumAmount;
  String? maximumAmount;
  List<String>? emailRestrictions;
  List<String>? usedBy;
  List<Map<String, dynamic>>? metaData;

  CouponModel({
    this.id,
    this.code,
    this.amount,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.discountType,
    this.description,
    this.dateExpires,
    this.dateExpiresGmt,
    this.usageCount,
    this.individualUse,
    this.productIds,
    this.excludedProductIds,
    this.usageLimit,
    this.usageLimitPerUser,
    this.limitUsageToXItems,
    this.freeShipping,
    this.productCategories,
    this.excludedProductCategories,
    this.excludeSaleItems,
    this.minimumAmount,
    this.maximumAmount,
    this.emailRestrictions,
    this.usedBy,
    this.metaData,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      code: json['code'],
      amount: json['amount'],
      dateCreated: DateTime.parse(json['date_created']),
      dateCreatedGmt: DateTime.parse(json['date_created_gmt']),
      dateModified: DateTime.parse(json['date_modified']),
      dateModifiedGmt: DateTime.parse(json['date_modified_gmt']),
      discountType: json['discount_type'],
      description: json['description'],
      dateExpires: json['date_expires'],
      dateExpiresGmt: json['date_expires_gmt'],
      usageCount: json['usage_count'],
      individualUse: json['individual_use'],
      productIds: List<int>.from(json['product_ids']),
      excludedProductIds: List<int>.from(json['excluded_product_ids']),
      usageLimit: json['usage_limit'],
      usageLimitPerUser: json['usage_limit_per_user'],
      limitUsageToXItems: json['limit_usage_to_x_items'],
      freeShipping: json['free_shipping'],
      productCategories: List<int>.from(json['product_categories']),
      excludedProductCategories:
          List<int>.from(json['excluded_product_categories']),
      excludeSaleItems: json['exclude_sale_items'],
      minimumAmount: json['minimum_amount'],
      maximumAmount: json['maximum_amount'],
      emailRestrictions: List<String>.from(json['email_restrictions']),
      usedBy: List<String>.from(json['used_by']),
      metaData: List<Map<String, dynamic>>.from(
          json['meta_data'].map((x) => Map<String, dynamic>.from(x))),
    );
  }
  Map<String, dynamic> toJson(CouponModel data) {
    return {
      'id': data.id,
      'code': data.code,
      'amount': data.amount,
      'date_created': data.dateCreated,
      'date_created_gmt': data.dateCreatedGmt,
      'date_modified': data.dateModified,
      'date_modified_gmt': data.dateModifiedGmt,
      'discount_type': data.discountType,
      'description': data.description,
      'date_expires': data.dateExpires,
      'date_expires_gmt': data.dateExpiresGmt,
      'usage_count': data.usageCount,
      'individual_use': data.individualUse,
      'product_ids': data.productIds,
      'excluded_product_ids': data.excludedProductIds,
      'usage_limit': data.usageLimit,
      'usage_limit_per_user': data.usageLimitPerUser,
      'limit_usage_to_x_items': data.limitUsageToXItems,
      'free_shipping': data.freeShipping,
      'product_categories': data.productCategories,
      'excluded_product_categories': data.excludedProductCategories,
      'exclude_sale_items': data.excludeSaleItems,
      'minimum_amount': data.minimumAmount,
      'maximum_amount': data.maximumAmount,
      'email_restrictions': data.emailRestrictions,
      'used_by': data.usedBy,
      'meta_data': data.metaData,
    };
  }
}
