import 'dart:developer';

import 'package:api_app/models/product.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();

  static List<Product> products = [];

  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  Future<List<String>> getAllCategory() async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/categories');
    List<dynamic> catagoris = response.data;
    log(catagoris.first);
    return catagoris.map((e) => e.toString()).toList();
  }

  Future<List<Product>> getFirstFiveProducts(int limit) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products?limit=$limit');
    List<dynamic> products = response.data;
    List<Product> productOne =
        products.map((e) => Product.fromJson(e)).toList();
    log(productOne.length.toString());
    return productOne;
  }

  Future<List<Product>> getCategoryProduct(String catName) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$catName');
    List<dynamic> categoris = response.data;
    List<Product> productOne =
        categoris.map((e) => Product.fromJson(e)).toList();
    log(productOne.length.toString());
    return productOne;
  }

  Future<List<Product>> getALLProduct() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List<dynamic> products = response.data;
    List<Product> productOne =
        products.map((e) => Product.fromJson(e)).toList();
    log(productOne.length.toString());
    return productOne;
  }
}
