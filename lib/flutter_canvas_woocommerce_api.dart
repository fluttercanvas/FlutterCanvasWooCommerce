// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';
import 'models/coupon_model.dart';
import 'models/customer_model.dart';
import 'models/order_model.dart';
import 'models/product_attribute_terms_model.dart';
import 'models/product_attridute_model.dart';
import 'models/product_catagory_model.dart';
import 'models/product_model.dart';
import 'models/product_tags_model.dart';
import 'models/shipping_zone_model.dart';
import 'package_services.dart';

class FlutterCanvasWooCommerce {
// using this class function with instance to use following variables for Communication using http package functions(GET,POST)
  static final FlutterCanvasWooCommerce instance = FlutterCanvasWooCommerce();

  String baseUrl = '';
  String consumerKey = '';
  String consumerSecret = '';

// Create and Update requests for this Key and Scerete must be allowed

  init(
      {required String baseUrl, // Domain Inforamtion (URL with scheme)
      required String consumerKey, // Key for Woo REST API from WordPress
      required String consumerSecret // Secrete for Woo REST API from WordPress
      }) {
    this.consumerKey = consumerKey;
   this. consumerSecret = consumerSecret;
   this. baseUrl = '$baseUrl/wp-json/wc/v3/';
  }

// This function will be use to get products created. Can get responses on basis of condition such as page_number or per_page .
// conditional basis working is under devlopment

  fetchProducts({
    int? perpage,
    int? page_number,
    Order? order,
    OrderBy? orderBy,
    String? type,
    bool? on_sale,
    int? categoryID,
    String? searchText,
    // ///////////////////////////
    String? context,
    String? after,
    String? before,
    DateTime? modified_after,
    DateTime? modified_before,
    bool? dates_are_gmt,
    List<int>? exclude,
    List<int>? include,
    int? offset,
    List<String>? parent,
    List<String>? parent_exclude,
    String? slug,
    String? status,
    String? sku,
    bool? featured,
    String? tag,
    String? shipping_class,
    String? attribute,
    String? attribute_term,
    String? tax_class,
    String? min_price,
    String? max_price,
    String? stock_status,
  }) async {
    String request_api = 'products';

// these conditions will make final url for get function according to condition given
    if (perpage != null) {
      if (perpage > 100 || perpage < 1) {
        throw Exception(
            'Per Page value must be between 1 and 100 , You have passed $perpage');
      }
      request_api = 'products?per_page=$perpage';
    } else {
      request_api = 'products?per_page=10';
    }
    if (page_number != null) {
      request_api = '$request_api&page=$page_number';
    }
    if (categoryID != null) {
      request_api = '$request_api&category=$categoryID';
    }
    if (searchText != null) {
      request_api = '$request_api&search=$searchText';
    }
    if (type != null) {
      request_api = '$request_api&type=$type';
    }
    if (order != null) {
      String orderType = 'asc';
      if (order == Order.ascending) {
        orderType = 'asc';
      }
      if (order == Order.descending) {
        orderType = 'desc';
      }
      request_api = '$request_api&order=$orderType';
    }
    if (orderBy != null) {
      if (orderBy == OrderBy.date) {
        request_api = '$request_api&orderby=date';
      }
      if (orderBy == OrderBy.id) {
        request_api = '$request_api&orderby=id';
      }
      if (orderBy == OrderBy.include) {
        request_api = '$request_api&orderby=include';
      }
      if (orderBy == OrderBy.title) {
        request_api = '$request_api&orderby=title';
      }
      if (orderBy == OrderBy.slug) {
        request_api = '$request_api&orderby=slug';
      }
      if (orderBy == OrderBy.popularity) {
        request_api = '$request_api&orderby=popularity';
      }
      if (orderBy == OrderBy.rating) {
        request_api = '$request_api&orderby=rating';
      }
    }
    if (on_sale != null) {
      request_api = '$request_api&on_sale=$on_sale';
    }
    if (context != null) {
      request_api += "&context=$context";
    }

    if (after != null) {
      request_api += "&after=$after";
    }

    if (before != null) {
      request_api += "&before=$before";
    }

    if (modified_after != null) {
      request_api += "&modified_after=$modified_after";
    }

    if (modified_before != null) {
      request_api += "&modified_before=$modified_before";
    }

    if (dates_are_gmt != null) {
      request_api += "&dates_are_gmt=$dates_are_gmt";
    }

    if (exclude != null) {
      request_api += "&exclude=${exclude.join(",")}";
    }

    if (include != null) {
      request_api += "&include=${include.join(",")}";
    }

    if (offset != null) {
      request_api += "&offset=$offset";
    }

    if (parent != null) {
      request_api += "&parent=${parent.join(",")}";
    }

    if (parent_exclude != null) {
      request_api += "&parent_exclude=${parent_exclude.join(",")}";
    }

    if (slug != null) {
      request_api += "&slug=$slug";
    }

    if (status != null) {
      request_api += "&status=$status";
    }

    if (sku != null) {
      request_api += "&sku=$sku";
    }

    if (featured != null) {
      request_api += "&featured=$featured";
    }

    if (tag != null) {
      request_api += "&tag=$tag";
    }

    if (shipping_class != null) {
      request_api += "&shipping_class=$shipping_class";
    }

    if (attribute != null) {
      request_api += "&attribute=$attribute";
    }

    if (attribute_term != null) {
      request_api += "&attribute_term=$attribute_term";
    }

    if (tax_class != null) {
      request_api += "&tax_class=$tax_class";
    }

    if (min_price != null) {
      request_api += "&min_price=$min_price";
    }

    if (max_price != null) {
      request_api += "&max_price=$max_price";
    }

    if (stock_status != null) {
      request_api += "&stock_status=$stock_status";
    }
// ApiService is another class in which http package functions are defined ,
// it'll make query get response and will pass response as it is if request is successful (i.e. Status Code == 200)
// or else if failed it'll throw exception with response recieved.
    Response res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    // since complete response is returned , response body will be decoded to get json object.
    var decoded_data = json.decode(res.body);

    List<Product> parsedProducts_List = [];
    for (var i = 0; i < decoded_data.length; i++) {



      Product parsedProducts = Product.fromJson(decoded_data[i]);
      parsedProducts_List.add(parsedProducts);
    }

// A model class for Product is created and will used by devloper to access and display or use data in whatever way,
// this function will return List of type Product model .
    return parsedProducts_List;
  }

  fetchProduct({required Proid}) async {
    String request_api = 'products';

    if (Proid != null) {
      request_api = '$request_api/$Proid';
    }

// ApiService is another class in which http package functions are defined ,
// it'll make query get response and will pass response as it is if request is successful (i.e. Status Code == 200)
// or else if failed it'll throw exception with response recieved.
    Response res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    // since complete response is returned , response body will be decoded to get json object.
    var decoded_data = json.decode(res.body);

// A model class for Product is created and will used by devloper to access and display or use data in whatever way,
// this function will return List of type Product model .
    Product parsedProduct = Product.fromJson(decoded_data);

    return parsedProduct;
  }

  orderHistory({
    int? orderID,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    String? modifiedAfter,
    String? modifiedBefore,
    bool? datesAreGmt,
    List<int>? exclude,
    List<int>? include,
    int? offset,
    Order? order,
    String? orderBy,
    List<int>? parent,
    List<int>? parentExclude,
    List<String>? status,
    int? woo_customer_id,
    int? product,
    int? dp,
  }) async {
    var orderHistory_request_api = 'orders';

    // If orderID is provided, fetch a single order
    if (orderID != null) {
      orderHistory_request_api = 'orders/$orderID';
    } else {
      // If orderID is not provided, fetch all orders with pagination and other parameters
      if (perPage != null) {
        orderHistory_request_api += '?per_page=$perPage';
      } else {
        orderHistory_request_api += '?per_page=10'; // Default perPage
      }

      if (context != null) {
        orderHistory_request_api += '&context=$context';
      }
      if (page != null) {
        orderHistory_request_api += '&page=$page';
      }
      if (search != null) {
        orderHistory_request_api += '&search=$search';
      }
      if (after != null) {
        orderHistory_request_api += '&after=$after';
      }
      if (before != null) {
        orderHistory_request_api += '&before=$before';
      }
      if (modifiedAfter != null) {
        orderHistory_request_api += '&modified_after=$modifiedAfter';
      }
      if (modifiedBefore != null) {
        orderHistory_request_api += '&modified_before=$modifiedBefore';
      }
      if (datesAreGmt != null) {
        orderHistory_request_api += '&dates_are_gmt=$datesAreGmt';
      }
      if (exclude != null && exclude.isNotEmpty) {
        orderHistory_request_api += '&exclude=${exclude.join(',')}';
      }
      if (include != null && include.isNotEmpty) {
        orderHistory_request_api += '&include=${include.join(',')}';
      }
      if (offset != null) orderHistory_request_api += '&offset=$offset';
      if (order != null) {
        String orderType = 'asc';
        if (order == Order.ascending) orderType = 'asc';
        if (order == Order.descending) orderType = 'desc';
        orderHistory_request_api += '&order=$orderType';
      }
      if (orderBy != null) orderHistory_request_api += '&orderby=$orderBy';
      if (parent != null && parent.isNotEmpty) {
        orderHistory_request_api += '&parent=${parent.join(',')}';
      }
      if (parentExclude != null && parentExclude.isNotEmpty) {
        orderHistory_request_api +=
            '&parent_exclude=${parentExclude.join(',')}';
      }
      if (status != null && status.isNotEmpty) {
        orderHistory_request_api += '&status=${status.join(',')}';
      }
      if (woo_customer_id != null) {
        orderHistory_request_api += '&customer=$woo_customer_id';
      }
      if (product != null) {
        orderHistory_request_api += '&product=$product';
      }
      if (dp != null) {
        orderHistory_request_api += '&dp=$dp';
      }
    }

    Response res = await ApiServices().getRequest(
        orderHistory_request_api, baseUrl, consumerKey, consumerSecret);
    var decodedData = json.decode(res.body);

    // If orderID is provided, return a single OrderModel object
    if (orderID != null) {
      return OrderModel.fromJson(decodedData);
    } else {
      // If orderID is not provided, return a list of OrderModel objects
      List<OrderModel> order_parsed_list = [];
      for (var i = 0; i < decodedData.length; i++) {
        OrderModel parseData = OrderModel.fromJson(decodedData[i]);
        order_parsed_list.add(parseData);
      }
      return order_parsed_list;
    }
  }

  create_customer({
    String firstName = '',
    String lastName = '',
    String phoneNumber = '',
    required String email,
    required String username,
    required String password,
    String address1 = '',
    String address2 = '',
    String city = '',
    String state = '',
    String postcode = '',
    String country = '',
  }) async {
    var customerData = {
      'username': username,
      'password': password,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'billing': {
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'state': state,
        'postcode': postcode,
        'country': country,
      },
      'shipping': {
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'state': state,
        'postcode': postcode,
        'country': country,
      },
    };
    Response res;
    var encodedData_customerData = json.encode(customerData);

    res = await ApiServices().postRequest(
        body: encodedData_customerData,
        request: 'customers',
        baseUrl: baseUrl,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret);

    var decoded_data = json.decode(res.body);
    CustomerModel parsedData = CustomerModel.fromJson(decoded_data);
    return parsedData;
  }

  shipping_zones({
    int? id,
  }) async {
    Response res;
    String? request_api = 'shipping/zones';
    if (id != null) {
      request_api = '$request_api/$id';
    }

    res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    var decoded_data = json.decode(res.body);
    List<ShippingZoneModel> parsed_list = [];
    for (var i = 0; i < decoded_data.length; i++) {
      ShippingZoneModel parse_data =
          ShippingZoneModel.fromJson(decoded_data[i]);
      parsed_list.add(parse_data);
    }
    return parsed_list;
  }

  get_coupon({
    String? context,
    int? id,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    String? modifiedAfter,
    String? modifiedBefore,
    bool? datesAreGmt,
    List<int>? exclude,
    List<int>? include,
    int? offset,
    Order? order,
    String? orderBy,
    String? code,
  }) async {
    String request_api = 'coupons';

    // If id is provided, fetch a single coupon
    if (id != null) {
      request_api = 'coupons/$id';
    } else {
      // If id is not provided, fetch all coupons with pagination and other parameters
      if (perPage != null) {
        request_api += '?per_page=$perPage';
      } else {
        request_api += '?per_page=10'; // Default perPage
      }

      if (context != null) request_api += '&context=$context';
      if (page != null) request_api += '&page=$page';
      if (search != null) request_api += '&search=$search';
      if (after != null) request_api += '&after=$after';
      if (before != null) request_api += '&before=$before';
      if (modifiedAfter != null) {
        request_api += '&modified_after=$modifiedAfter';
      }
      if (modifiedBefore != null) {
        request_api += '&modified_before=$modifiedBefore';
      }
      if (datesAreGmt != null) request_api += '&dates_are_gmt=$datesAreGmt';
      if (exclude != null) request_api += '&exclude=${exclude.join(',')}';
      if (include != null) request_api += '&include=${include.join(',')}';
      if (offset != null) request_api += '&offset=$offset';
      if (order != null) {
        String orderType = 'asc';
        if (order == Order.ascending) {
          orderType = 'asc';
        }
        if (order == Order.descending) {
          orderType = 'desc';
        }
        request_api = '$request_api&order=$orderType';
      }
      if (orderBy != null) request_api += '&orderby=$orderBy';
      if (code != null) request_api += '&code=$code';
    }

    Response res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    var decode_data = json.decode(res.body);

    // If id is provided, return a single CouponModel object
    if (id != null) {
      return CouponModel.fromJson(decode_data);
    } else {
      // If id is not provided, return a list of CouponModel objects
      List<CouponModel> parsed_list = [];
      for (var i = 0; i < decode_data.length; i++) {
        CouponModel parsed_data = CouponModel.fromJson(decode_data[i]);
        parsed_list.add(parsed_data);
      }
      return parsed_list;
    }
  }

  get_category({
    String? context,
    int? page,
    int? perPage,
    String? search,
    List<int>? exclude,
    List<int>? include,
    String? order,
    String? orderBy,
    bool? hideEmpty,
    int? parent,
    int? product,
    String? slug,
    int? id,
  }) async {
    String request_api = 'products/categories';

    // If id is provided, fetch a single category
    if (id != null) {
      request_api = 'products/categories/$id';
    } else {
      // If id is not provided, fetch all categories with pagination
      if (perPage != null) {
        request_api += '?per_page=$perPage';
      } else {
        request_api += '?per_page=10'; // Default perPage
      }

      if (context != null) request_api += '&context=$context';
      if (page != null) request_api += '&page=$page';
      if (search != null) request_api += '&search=$search';
      if (exclude != null) request_api += '&exclude=${exclude.join(',')}';
      if (include != null) request_api += '&include=${include.join(',')}';
      if (order != null) request_api += '&order=$order';
      if (orderBy != null) request_api += '&orderby=$orderBy';
      if (hideEmpty != null) request_api += '&hide_empty=$hideEmpty';
      if (parent != null) request_api += '&parent=$parent';
      if (product != null) request_api += '&product=$product';
      if (slug != null) request_api += '&slug=$slug';
    }

    Response res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    var decode_data = json.decode(res.body);

    if (id != null) {
      return ProductCategoryModel.fromJson(decode_data);
    } else {
      List<ProductCategoryModel> parsed_list = [];
      for (var i = 0; i < decode_data.length; i++) {
        ProductCategoryModel parsed_data =
            ProductCategoryModel.fromJson(decode_data[i]);
        parsed_list.add(parsed_data);
      }
      return parsed_list;
    }
  }

  getCustomer(
      {int? id,
      String? context,
      int? page,
      int? perPage,
      String? search,
      List<int>? exclude,
      List<int>? include,
      int? offset,
      String? order,
      String? orderBy,
      String? email,
      String? role}) async {
    var request_api = 'customers';

    // If an ID is provided, append it to the request_api
    if (id != null) {
      request_api += '/$id';
    }

    // Constructing the query parameters based on the provided parameters
    if (context != null ||
        page != null ||
        perPage != null ||
        search != null ||
        exclude != null ||
        include != null ||
        offset != null ||
        order != null ||
        orderBy != null ||
        email != null ||
        role != null) {
      request_api += '?';
      if (context != null) request_api += 'context=$context&';
      if (page != null) request_api += 'page=$page&';
      if (perPage != null) request_api += 'per_page=$perPage&';
      if (search != null) request_api += 'search=$search&';
      if (exclude != null) request_api += 'exclude=${exclude.join(",")}&';
      if (include != null) request_api += 'include=${include.join(",")}&';
      if (offset != null) request_api += 'offset=$offset&';
      if (order != null) request_api += 'order=$order&';
      if (orderBy != null) request_api += 'orderby=$orderBy&';
      if (email != null) request_api += 'email=$email&';
      if (role != null) request_api += 'role=$role&';

      // Removing the last '&' character if present
      request_api = request_api.endsWith('&')
          ? request_api.substring(0, request_api.length - 1)
          : request_api;
    }

    Response res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    var decoded_data = json.decode(res.body);
    if (id != null) {
      return CustomerModel.fromJson(decoded_data);
    } else {
      return (decoded_data as List)
          .map((customerJson) => CustomerModel.fromJson(customerJson))
          .toList();
    }
  }
   create_product(
      {String? name,
      String? type,
      String? status,
      tags,
      images,
      attributes,
      default_attributes,
      String? description,
      String? short_description,
      String? price,
      String? salePrice,
      date_on_sale_from,
      date_on_sale_from_gmt,
      date_on_sale_to,
      date_on_sale_to_gmt,
      bool? virtual,
      bool? downloadable,
      downloads,
      int? downloads_limit,
      int? downloads_expiry,
      String? external_url,
      String? button_text,
      String? tax_status,
      String? tax_class,
      bool? manage_stock,
      stock_quantity,
      String? stock_status,
      bool? backorders,
      bool? sold_individually,
      String? weight,
      String? dimensions,
      length,
      width,
      height,
      upsell_ids,
      cross_sell_ids,
      int? parent_id,
      String? purchase_note,
      featured,
      grouped_products,
      int? menu_order,
      String? meta_data,
      String? id}) async {
    var data = {
      'name': name,

      'type': type,
      'status': status,
      'tags': [],
      'images': [],
      'attributes': [],
      'default_attributes': [],
      'description': description,
      'short_description': short_description,
      'regular_price': price,
      'sale_price': salePrice,
      'date_on_sale_from': date_on_sale_from,
      'date_on_sale_from_gmt': date_on_sale_from_gmt,
      'date_on_sale_to': date_on_sale_to,
      'date_on_sale_to_gmt': date_on_sale_to_gmt,
      'virtual': virtual,
      'downloadable': downloadable,
      'downloads': [],
      'downloads_lomit': downloads_limit,
      'downloads_expiry': downloads_expiry,
      'external_url': external_url,
      'button_text': button_text,
      'tax_status': tax_status,
      'tax_class': tax_class,
      'manage_stock': manage_stock,
      'stock_quantity': stock_quantity,
      'stock_status': stock_status,
      'backorders': backorders,
      'sold_individually': sold_individually,
      'weight': weight,
      'dimensions': {},
      'upsell_ids': [],
      'cross_sell_ids': [],
      'parent_id': parent_id,
      'purchase_note': purchase_note,
      // 'featured': featured,
      'grouped_products': [],
      'menu_order': menu_order,
      'meta_data': [],
      'categories': [],
    };

    var encodedData = jsonEncode(data);

    var response = await ApiServices().postRequest(
        body: encodedData,
        request: 'products',
        baseUrl: baseUrl,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret);
    var decodedData = jsonDecode(response.body);
    // Product parsedData = Product.fromJson(decodedData);
    // return parsedData;
    return decodedData;
  }

  // create_shipping_class({required String? name, String? description}) async {
  //   var data = {'name': name, 'description': description};
  //   var encodedData = jsonEncode(data);
  //   var response = await ApiServices().postRequest(
  //       body: encodedData,
  //       request: 'products/shipping_classes',
  //       baseUrl: baseUrl,
  //       consumerKey: consumerKey,
  //       consumerSecret: consumerSecret);
  //   var decodedData = jsonDecode(response.body);
  //   return decodedData;
  // }

  create_categories({
    required String? name,
    int? parent,
    String? description,
    String? display,
    int? id,
    String? src,
    String? name_img,
    String? alt,
    int? menu_order,
  }) async {
    var data = {
      "name": name,
      'parent': parent,
      'description': description,
      'display': display,
      'image': {},
      'menu_order': menu_order,
    };

    var encodedData = jsonEncode(data);
    var response = await ApiServices().postRequest(
        body: encodedData,
        request: 'products/categories',
        baseUrl: baseUrl,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret);
    var decodedData = jsonDecode(response.body);

    return decodedData;
  }

  create_attributes(
      {required String? name,
      String? type,
      String? order_by,
      bool? has_archives}) async {
    var data = {
      'name': name,
      'type': type,
      'order_by': order_by,
      'has_archives': has_archives
    };

    var encodedData = jsonEncode(data);
    var response = await ApiServices().postRequest(
        body: encodedData,
        request: 'products/attributes',
        baseUrl: baseUrl,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret);
    var decodedData = jsonDecode(response.body);
    // print(decodedData);
    return decodedData;
  }

  get_attributes({String? context}) async {
    String request_api = 'products/attributes';
    var res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    // print(res);
    var decode_data = json.decode(res.body);
    print(decode_data);
    if (decode_data != null) {
      return ProductAttriduteModel.fromJson(decode_data);
    } else {
      List<ProductAttriduteModel> attridutes_list = [];
      for (var i = 0; i < decode_data.length; i++) {
        // print('kjidfk$i');
        ProductAttriduteModel attridutes_data =
            ProductAttriduteModel.fromJson(decode_data[i]);
        attridutes_list.add(attridutes_data);
      }
      return attridutes_list;
    }
  }

  create_attributes_terms({
    int? id,
    required String? name,
    String? description,
    int? menu_order,
  }) async {
    var data = {
      // 'id': id,
      'name': name,
      'description': description,
      'menu_order': menu_order,
    };
    var encodedData = jsonEncode(data);
    var response = await ApiServices().postRequest(
        body: encodedData,
        request: 'products/attributes/$id/terms',
        baseUrl: baseUrl,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret);
    var decodedData = jsonDecode(response.body);
    return decodedData;
  }

  get_attribut_terms({String? context, required String? id}) async {
    String request_api = 'products/attributes/$id/terms';
    var res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    // print(res);
    var decode_data = json.decode(res.body);
    print(decode_data);
    if (decode_data != null) {
      return ProductAttributeTermsModel.fromJson(decode_data[0]);
    } else {
      List<ProductAttributeTermsModel> attridutes_terms_list = [];
      for (var i = 0; i < decode_data.length; i++) {
        ProductAttributeTermsModel attridutes_terms_data =
            ProductAttributeTermsModel.fromJson(decode_data[i]);
        attridutes_terms_list.add(attridutes_terms_data);
      }
      return attridutes_terms_list;
    }
  }

  create_tags({required String? name, String? description}) async {
    var data = {'name': name, 'description': description};

    Response response;
    var encodedData = jsonEncode(data);
    response = await ApiServices().postRequest(
        body: encodedData,
        request: 'products/tags',
        baseUrl: baseUrl,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret);
    var decodedData = jsonDecode(response.body);

    return decodedData;
  }

  get_tags(
      {String? context,
      int? page,
      int? per_page,
      String? search,
      List<int>? exclude,
      List<int>? include,
      int? offset,
      String? order,
      String? orderby,
      bool? hide_enpty,
      int? product,
      String? slug,
      int? id}) async {
    String request_api = 'products/tags';

    var res = await ApiServices()
        .getRequest(request_api, baseUrl, consumerKey, consumerSecret);
    // print(res);
    var decode_data = json.decode(res.body);
    print(decode_data);
    if (decode_data != null) {
      return ProductTagsModel.fromJson(decode_data);
    } else {
      List<ProductTagsModel> attridutes_list = [];
      for (var i = 0; i < decode_data.length; i++) {
        ProductTagsModel attridutes_data =
            ProductTagsModel.fromJson(decode_data[i]);
        attridutes_list.add(attridutes_data);
      }
      return attridutes_list;
    }
  }
}

enum Order { ascending, descending }

enum OrderBy { date, id, include, title, slug, popularity, rating }
