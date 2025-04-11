// ignore_for_file: non_constant_identifier_names

class Product {
  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final String? type;
  final String? status;
  final bool? featured;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? Productprice;
  final String? Price;
  final String? salePrice;
  final String? priceHtml;
  final bool? onSale;
  final bool? purchasable;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<Download>? downloads;
  final int? downloadLimit;
  final int? downloadExpiry;
  final String? externalUrl;
  final String? buttonText;
  final String? taxStatus;
  final String? taxClass;
  final bool? manageStock;
  final int? stockQuantity;
  final String? stockStatus;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final bool? soldIndividually;
  final String? weight;
  final Map<String, dynamic>? dimensions;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final int? ratingCount;
  final List? relatedIds;
  final List? upsellIds;
  final List? crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<Categories>? categories;
  final List<Tags>? tags;
  final List<ImageModel>? images;
  final List<Attribute>? attributes;
  final List<Attribute>? defaultAttributes;
  final List? variations;
  final List? groupedProducts;
  final int? menuOrder;
  final List<dynamic>? metaData;
  final String? dateCreated;
  final String? dateCreatedGMT;
  final String? timeList;
  final String? duration;

  Product(
      {this.duration,
      this.timeList,
      this.id,
      this.name,
      this.slug,
      this.permalink,
      this.type,
      this.status,
      this.featured,
      this.catalogVisibility,
      this.description,
      this.shortDescription,
      this.sku,
      this.Productprice,
      this.Price,
      this.salePrice,
      this.priceHtml,
      this.onSale,
      this.purchasable,
      this.totalSales,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.externalUrl,
      this.buttonText,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      this.stockQuantity,
      this.stockStatus,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.soldIndividually,
      this.weight,
      this.dimensions,
      this.shippingRequired,
      this.shippingTaxable,
      this.shippingClass,
      this.shippingClassId,
      this.reviewsAllowed,
      this.averageRating,
      this.ratingCount,
      this.relatedIds,
      this.upsellIds,
      this.crossSellIds,
      this.parentId,
      this.purchaseNote,
      this.categories,
      this.tags,
      this.images,
      this.attributes,
      this.defaultAttributes,
      this.variations,
      this.groupedProducts,
      this.menuOrder,
      this.metaData,
      this.dateCreated,
      this.dateCreatedGMT});

  factory Product.fromJson(Map<String, dynamic> json) {
    // print('dlk$json');
    List<Download> download = [];
    for (var i = 0; i < json['downloads'].length; i++) {
      download.add(Download.fromJson(json['downloads'][i]));
    }
    // List<Categories> categoriesList = [];

    // if (json['categories'] != null) {
    //   if (json['categories'] is List) {
    //     categoriesList = (json['categories'] as List)
    //         .map((i) => Categories.fromJson(i))
    //         .toList();
    //   } else if (json['categories'] is int) {
    //     categoriesList.add(Categories(id: json['categories']));
    //   }
    // }

    return Product(
        // duration: durationn['value'],
        // timeList: timeListt,
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        permalink: json['permalink'],
        type: json['type'],
        status: json['status'],
        featured: json['featured'],
        catalogVisibility: json['catalog_visibility'],
        description: json['description'],
        shortDescription: json['short_description'],
        sku: json['sku'],
        Productprice: json['price'],
        Price: json['regular_price'],
        salePrice: (json['sale_price'] is String
            ? json['sale_price']
            : json['sale_price'].toString()),
        priceHtml: json['price_html'],
        onSale: json['on_sale'],
        purchasable: json['purchasable'],
        totalSales: json['total_sales'],
        virtual: json['virtual'],
        downloadable: json['downloadable'],
        downloads: download,
        downloadLimit: json['download_limit'],
        downloadExpiry: json['download_expiry'],
        externalUrl: json['external_url'],
        buttonText: json['button_text'],
        taxStatus: json['tax_status'],
        taxClass: json['tax_class'],
        manageStock: json['manage_stock'],
        stockQuantity: json['stock_quantity'],
        stockStatus: json['stock_status'],
        backorders: json['backorders'],
        backordersAllowed: json['backorders_allowed'],
        backordered: json['backordered'],
        soldIndividually: json['sold_individually'],
        weight: json['weight'].toString(),
        dimensions: json['dimensions'],
        shippingRequired: json['shipping_required'],
        shippingTaxable: json['shipping_taxable'],
        shippingClass: json['shipping_class'],
        shippingClassId: json['shipping_class_id'],
        reviewsAllowed: json['reviews_allowed'],
        averageRating: json['average_rating'],
        ratingCount: json['rating_count'],
        relatedIds: json['related_ids'],
        upsellIds: json['upsell_ids'],
        crossSellIds: json['cross_sell_ids'],
        parentId: json['parent_id'],
        purchaseNote: json['purchase_note'],
        categories: (json['categories'] as List)
            .map((i) => Categories.fromJson(i))
            .toList(),
        // categories: json['categories'].cast<int>(),
        tags: (json['tags'] as List).map((i) => Tags.fromJson(i)).toList(),
        images: (json['images'] as List)
            .map((i) => ImageModel.fromJson(i))
            .toList(),
        attributes: (json['attributes'] as List)
            .map((i) => Attribute.fromJson(i))
            .toList(),
        defaultAttributes: (json['default_attributes'] as List)
            .map((i) => Attribute.fromJson(i))
            .toList(),
        variations: json['variations'],
        groupedProducts: json['grouped_products'],
        menuOrder: json['menu_order'],
        dateCreated: json['date_created'],
        dateCreatedGMT: json['date_created_gmt'],
        metaData: json['meta_data']);
  }

  get toList => null;
  Map<String, dynamic> toMap() {
    return {
      "timeList": timeList,
      "id": id,
      "name": name,
      "slug": slug,
      "permalink": permalink,
      "type": type,
      "status": status,
      "featured": featured,
      "catalogVisibility": catalogVisibility,
      "description": description,
      "short_description": shortDescription,
      "sku": sku,
      "price": Productprice,
      "regular_price": Price,
      "sale_Price": salePrice,
      "priceHtml": priceHtml,
      "onSale": onSale,
      "purchasable": purchasable,
      "totalSales": totalSales,
      "virtual": virtual,
      "downloadable": downloadable,
      "downloads": downloads,
      "downloadLimit": downloadLimit,
      "downloadExpiry": downloadExpiry,
      "externalUrl": externalUrl,
      "buttonText": buttonText,
      "taxStatus": taxStatus,
      "taxClass": taxClass,
      "manageStock": manageStock,
      "stockQuantity": stockQuantity,
      "stockStatus": stockStatus,
      "backorders": backorders,
      "backordersAllowed": backordersAllowed,
      "backordered": backordered,
      "soldIndividually": soldIndividually,
      "weight": weight,
      "dimensions": dimensions,
      "shippingRequired": shippingRequired,
      "shippingTaxable": shippingTaxable,
      "shippingClass": shippingClass,
      "shippingClassId": shippingClassId,
      "reviewsAllowed": reviewsAllowed,
      "averageRating": averageRating,
      "ratingCount": ratingCount,
      "relatedIds": relatedIds,
      "upsellIds": upsellIds,
      "crossSellIds": crossSellIds,
      "parentId": parentId,
      "purchaseNote": purchaseNote,
      'images': images != null ? images!.map((i) => i.toJson()).toList() : [],
      'categories':
          // 'categories': categories,
          categories != null ? categories!.map((i) => i.toJson()).toList() : [],
      'tags': tags != null ? tags!.map((i) => i.toJson()).toList() : [],
      "attributes": attributes,
      "defaultAttributes": defaultAttributes,
      "variations": variations,
      "groupedProducts": groupedProducts,
      "menuOrder": menuOrder,
      "metaData": metaData,
      "dateCreated": dateCreated,
      "dateCreatedGMT": dateCreatedGMT,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      if (timeList != null) "timeList": timeList,
      if (id != null) "id": id,
      "name": name,
      if (slug != null) "slug": slug,
      if (permalink != null) "permalink": permalink,
      if (type != null) "type": type,
      if (status != null) "status": status,
      if (featured != null) "featured": featured,
      if (catalogVisibility != null) "catalog_visibility": catalogVisibility,
      if (description != null) "description": description,
      if (shortDescription != null) "short_description": shortDescription,
      if (sku != null) "sku": sku,
      if (Productprice != null) "price": Productprice,
      if (Price != null) "regular_price": Price,
      if (salePrice != null) "sale_price": salePrice,
      if (priceHtml != null) "price_html": priceHtml,
      if (onSale != null) "on_sale": onSale,
      if (purchasable != null) "purchasable": purchasable,
      if (totalSales != null) "total_sales": totalSales,
      if (virtual != null) "virtual": virtual,
      if (downloadable != null) "downloadable": downloadable,
      if (downloads != null) "downloads": downloads,
      if (downloadLimit != null) "download_limit": downloadLimit,
      if (downloadExpiry != null) "download_expiry": downloadExpiry,
      if (externalUrl != null) "external_url": externalUrl,
      if (buttonText != null) "button_text": buttonText,
      if (taxStatus != null) "tax_status": taxStatus,
      if (taxClass != null) "tax_class": taxClass,
      if (manageStock != null) "manage_stock": manageStock,
      if (stockQuantity != null) "stock_quantity": stockQuantity,
      if (stockStatus != null) "stock_status": stockStatus,
      if (backorders != null) "backorders": backorders,
      if (backordersAllowed != null) "backorders_allowed": backordersAllowed,
      if (backorders != null) "backordered": backordered,
      if (soldIndividually != null) "sold_individually": soldIndividually,
      if (weight != null) "weight": weight,
      if (dimensions != null) "dimensions": dimensions,
      if (shippingRequired != null) "shipping_required": shippingRequired,
      if (shippingTaxable != null) "shipping_taxable": shippingTaxable,
      if (shippingClass != null) "shipping_class": shippingClass,
      if (shippingClassId != null) "shipping_class_id": shippingClassId,
      if (reviewsAllowed != null) "reviews_allowed": reviewsAllowed,
      if (averageRating != null) "average_rating": averageRating,
      if (ratingCount != null) "rating_count": ratingCount,
      if (relatedIds != null) "related_ids": relatedIds,
      if (upsellIds != null) "upsell_ids": upsellIds,
      if (crossSellIds != null) "cross_sell_ids": crossSellIds,
      if (parentId != null) "parent_id": parentId,
      if (purchaseNote != null) "purchase_note": purchaseNote,
      if (images != null)
        'images': images != null ? images!.map((i) => i.toJson()).toList() : [],
      if (categories != null)
        // 'categories': [
        //   {'id': categories}
        // ],
        'categories': categories != null
            ? categories!.map((i) => i.toJson()).toList()
            : [],
      if (tags != null)
        'tags': tags != null ? tags!.map((i) => i.toJson()).toList() : [],
      if (attributes != null)
        "attributes": attributes != null
            ? attributes!.map((i) => i.toJson()).toList()
            : [],
      if (defaultAttributes != null) "default_attributes": defaultAttributes,
      if (variations != null) "variations": variations,
      if (groupedProducts != null) "grouped_products": groupedProducts,
      if (menuOrder != null) "menu_Order": menuOrder,
      if (metaData != null) "meta_Data": metaData,
      if (dateCreated != null) "date_created": dateCreated,
      if (dateCreatedGMT != null) "date_created_gmt": dateCreatedGMT,
    };
  }
}

class Attribute {
  final int? id;
  final String? name;
  final int? position;
  final bool? visible;
  final bool? variation;
  final List<String>? options;

  Attribute(this.id, this.name, this.position, this.visible, this.variation,
      this.options);

  Attribute.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        position = json['position'],
        visible = json['visible'],
        variation = json['variation'],
        options = json['options'].cast<String>();

  Map<String, dynamic> toJson() => {
        'id': id,
        if (name != null) 'name': name,
        if (position != null) 'position': position,
        if (visible != null) 'visible': visible,
        if (variation != null) 'variation': variation,
        if (options != null) 'options': options,
      };
}

class Download {
  final String? id;
  final String? name;
  final String? file;

  Download(this.id, this.name, this.file);

  Download.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        file = json['file'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'file': file,
      };
}

class Categories {
  final int? id;
  final String? name;
  final String? slug;

  Categories({
    this.id,
    this.name,
    this.slug,
  });
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(id: json['id'], name: json['name'], slug: json['slug']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
    };
  }
}

class Tags {
  final int? id;
  final String? name;
  final String? slug;
  Tags({
    this.id,
    this.name,
    this.slug,
  });

  Tags.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'];

  Map<String, dynamic> toJson() => {
        'id': id,
        if (name != null) 'name': name,
        if (slug != null) 'slug': slug,
      };
}

class ImageModel {
  final int? id;
  final String? src;
  final String? name;
  final String? alt;

  ImageModel({
    this.id,
    this.src,
    this.name,
    this.alt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
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
