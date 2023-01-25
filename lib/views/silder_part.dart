import 'package:api_app/models/product.dart';
import 'package:api_app/provider/api_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SilderPart extends StatefulWidget {
  List<Product> product;
  SilderPart(this.product);
  @override
  State<StatefulWidget> createState() {
    return _SilderPart();
  }
}

class _SilderPart extends State<SilderPart> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, provider, child) {
        return Column(children: [
          Expanded(
            child: CarouselSlider(
              items: provider.aLLProduct
                  .map((e) => Image.network(
                        e.image ?? '',
                        height: MediaQuery.of(context).size.height / 4,
                      ))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: provider.firstFiveProducts.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ]);
      },
    );
  }
}
