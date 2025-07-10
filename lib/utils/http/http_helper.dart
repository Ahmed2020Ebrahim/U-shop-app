import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  // HttpHelper._();
//! ---> base url
  final String baseUrl;

  HttpHelper({required this.baseUrl});

//! ---> get request
  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse("$baseUrl/$endpoint"));
    return _handleResponse(response);
  }

//! ---> post request
  Future<Map<String, dynamic>> post({required String endpoint, required dynamic data}) async {
    final response = await http.post(
      Uri.parse("$baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

//! ---> put request
  Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

//! ---> delete request
  Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse("$baseUrl/$endpoint"));
    return _handleResponse(response);
  }

//! ---> response handle
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);
      data['success'] = true;
      return data;
    } else {
      throw Exception("Faild to load Data: ${response.statusCode}");
    }
  }
}
