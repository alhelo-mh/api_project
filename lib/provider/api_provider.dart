import 'dart:developer';

import 'package:api_app/models/product.dart';
import 'package:api_app/network/api_dio.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    log('cearte Provider');
    getAllCategory();
    getALLProduct();
    getFirstFiveProducts(5);
  }
  List<String> allCategory = [];
  List<Product> firstFiveProducts = [];
  List<Product> categoryProduct = [];
  List<Product> aLLProduct = [];
  String selectcat = '';

  selectCategory(String cat) {
    selectcat = cat;
    notifyListeners();
    if (cat == "All") {
      getALLProduct();
    } else {
      getCategoryProduct(cat);
      notifyListeners();
    }
  }

  getAllCategory() async {
    List<String> categoris = await ApiHelper.apiHelper.getAllCategory();
    allCategory.add("All");
    allCategory.addAll(categoris);
    //  selectCategory(allCategory);
    // log(categoris.length.toString());
    notifyListeners();
    selectCategory(allCategory.first);
  }

  getFirstFiveProducts(int limit) async {
    firstFiveProducts = await ApiHelper.apiHelper.getFirstFiveProducts(limit);
    notifyListeners();
    log('message');
    return firstFiveProducts;
  }

  getCategoryProduct(String catName) async {
    categoryProduct = await ApiHelper.apiHelper.getCategoryProduct(catName);
    return categoryProduct;
  }

  getALLProduct() async {
    aLLProduct = await ApiHelper.apiHelper.getALLProduct();
    return aLLProduct;
  }
}
