import 'package:api_app/models/product.dart';
import 'package:api_app/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorisPart extends StatelessWidget {
  List<String> categoris;
  CategorisPart(this.categoris, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoris.map((e) {
          return InkWell(
            onTap: () {
              Provider.of<ApiProvider>(context, listen: false)
                  .selectCategory(e);
            },
            child: Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Provider.of<ApiProvider>(context, listen: false)
                                .selectcat ==
                            e
                        ? Colors.orange
                        : Colors.blue),
                child: Center(
                  child: Text(
                    e,
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          );
        }).toList(),
      ),
    );
  }
}
