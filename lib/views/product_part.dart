import 'package:api_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductPart extends StatelessWidget {
  List<Product> product;
  ProductPart(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: product.length,
      itemBuilder: (context, index) {
        return Image.network(product[index].image ?? '');
      },
    );
  }
}
