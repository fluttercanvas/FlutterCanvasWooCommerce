class OrderModel {
  final int? id;
  final int? parentId;
  final String? number;
  final String? orderKey;
  final String? createdVia;
  final String? version;
  final String status;
  final String currency;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? discountTotal;
  final String? discountTax;
  final String? shippingTotal;
  final String? shippingTax;
  final String? cartTax;
  final String? total;
  final String? totalTax;
  final bool pricesIncludeTax;
  final int customerId;
  final String? customerIpAddress;
  final String? customerUserAgent;
  final String? customerNote;
  final dynamic billing;
  final dynamic shipping;
  final String? paymentMethod;
  final String? paymentMethodTitle;
  final String? transactionId;
  final DateTime? datePaid;
  final DateTime? datePaidGmt;
  final DateTime? dateCompleted;
  final DateTime? dateCompletedGmt;
  final String? cartHash;
  final List<dynamic>? metaData;
  final List<dynamic>? lineItems;
  final List<dynamic>? taxLines;
  final List<dynamic>? shippingLines;
  final List<dynamic>? feeLines;
  final List<dynamic>? couponLines;
  final List<dynamic>? refunds;
  final bool setPaid;

  OrderModel({
    this.id,
    this.parentId,
    this.number,
    this.orderKey,
    this.createdVia,
    this.version,
    this.status = 'pending',
    this.currency = 'USD',
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.cartTax,
    this.total,
    this.totalTax,
    this.pricesIncludeTax = false,
    this.customerId = 0,
    this.customerIpAddress,
    this.customerUserAgent,
    this.customerNote,
    this.billing,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
    this.transactionId,
    this.datePaid,
    this.datePaidGmt,
    this.dateCompleted,
    this.dateCompletedGmt,
    this.cartHash,
    this.metaData,
    this.lineItems,
    this.taxLines,
    this.shippingLines,
    this.feeLines,
    this.couponLines,
    this.refunds,
    this.setPaid = false,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      parentId: json['parent_id'],
      number: json['number'],
      orderKey: json['order_key'],
      createdVia: json['created_via'],
      version: json['version'],
      status: json['status'] ?? 'pending',
      currency: json['currency'] ?? 'USD',
      dateCreated: json['date_created'] != null
          ? DateTime.parse(json['date_created'])
          : null,
      dateCreatedGmt: json['date_created_gmt'] != null
          ? DateTime.parse(json['date_created_gmt'])
          : null,
      dateModified: json['date_modified'] != null
          ? DateTime.parse(json['date_modified'])
          : null,
      dateModifiedGmt: json['date_modified_gmt'] != null
          ? DateTime.parse(json['date_modified_gmt'])
          : null,
      discountTotal: json['discount_total'],
      discountTax: json['discount_tax'],
      shippingTotal: json['shipping_total'],
      shippingTax: json['shipping_tax'],
      cartTax: json['cart_tax'],
      total: json['total'],
      totalTax: json['total_tax'],
      pricesIncludeTax: json['prices_include_tax'] ?? false,
      customerId: json['customer_id'] ?? 0,
      customerIpAddress: json['customer_ip_address'],
      customerUserAgent: json['customer_user_agent'],
      customerNote: json['customer_note'],
      billing: json['billing'],
      shipping: json['shipping'],
      paymentMethod: json['payment_method'],
      paymentMethodTitle: json['payment_method_title'],
      transactionId: json['transaction_id'],
      datePaid:
          json['date_paid'] != null ? DateTime.parse(json['date_paid']) : null,
      datePaidGmt: json['date_paid_gmt'] != null
          ? DateTime.parse(json['date_paid_gmt'])
          : null,
      dateCompleted: json['date_completed'] != null
          ? DateTime.parse(json['date_completed'])
          : null,
      dateCompletedGmt: json['date_completed_gmt'] != null
          ? DateTime.parse(json['date_completed_gmt'])
          : null,
      cartHash: json['cart_hash'],
      metaData: json['meta_data'],
      lineItems: json['line_items'],
      taxLines: json['tax_lines'],
      shippingLines: json['shipping_lines'],
      feeLines: json['fee_lines'],
      couponLines: json['coupon_lines'],
      refunds: json['refunds'],
      setPaid: json['set_paid'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_id': parentId,
      'number': number,
      'order_key': orderKey,
      'created_via': createdVia,
      'version': version,
      'status': status,
      'currency': currency,
      'date_created': dateCreated?.toIso8601String(),
      'date_created_gmt': dateCreatedGmt?.toIso8601String(),
      'date_modified': dateModified?.toIso8601String(),
      'date_modified_gmt': dateModifiedGmt?.toIso8601String(),
      'discount_total': discountTotal,
      'discount_tax': discountTax,
      'shipping_total': shippingTotal,
      'shipping_tax': shippingTax,
      'cart_tax': cartTax,
      'total': total,
      'total_tax': totalTax,
      'prices_include_tax': pricesIncludeTax,
      'customer_id': customerId,
      'customer_ip_address': customerIpAddress,
      'customer_user_agent': customerUserAgent,
      'customer_note': customerNote,
      'billing': billing,
      'shipping': shipping,
      'payment_method': paymentMethod,
      'payment_method_title': paymentMethodTitle,
      'transaction_id': transactionId,
      'date_paid': datePaid?.toIso8601String(),
      'date_paid_gmt': datePaidGmt?.toIso8601String(),
      'date_completed': dateCompleted?.toIso8601String(),
      'date_completed_gmt': dateCompletedGmt?.toIso8601String(),
      'cart_hash': cartHash,
      'meta_data': metaData,
      'line_items': lineItems,
      'tax_lines': taxLines,
      'shipping_lines': shippingLines,
      'fee_lines': feeLines,
      'coupon_lines': couponLines,
      'refunds': refunds,
      'set_paid': setPaid,
    };
  }
}
