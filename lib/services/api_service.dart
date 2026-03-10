import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../core/constants.dart';

class ApiService {

  static Future<List<Product>> fetchProducts() async {

    final response =
        await http.get(Uri.parse(AppConstants.apiUrl));

    final List data = jsonDecode(response.body);

    return data.map((e) => Product.fromJson(e)).toList();

  }

}