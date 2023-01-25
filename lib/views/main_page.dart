import 'package:api_app/models/product.dart';
import 'package:api_app/network/api_dio.dart';
import 'package:api_app/provider/api_provider.dart';
import 'package:api_app/views/category_part.dart';
import 'package:api_app/views/product_part.dart';
import 'package:api_app/views/silder_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(builder: (context, provider, v) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: MediaQuery.of(context).size.height / 4,
                  child: SilderPart(provider.aLLProduct)),
              CategorisPart(provider.allCategory),
              ProductPart(provider.categoryProduct)
            ],
          ),
        ),
      );
    });
  }
}
