import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> getRequest(
      String request, baseUrl, consumerKey, consumerSecret) async {
    final response = await http.get(
      Uri.parse(baseUrl! + request),
      // Add your authentication headers here
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'Error -: Failed to Complete Request : ${json.decode(response.body)}');
    }
  }

  postRequest(
      {required body,
      required String request,
      required String baseUrl,
      required String consumerKey,
      required String consumerSecret}) async {
    final response = await http.post(
      Uri.parse(baseUrl + request),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
      },
      body: body,
    );

    // Check if the request was successful (status code 201)
    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception(
          'Error -: Failed to Complete Request : ${json.decode(response.body)}');
    }
  }
}
