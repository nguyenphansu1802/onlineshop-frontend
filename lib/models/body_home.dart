// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/detail_item.dart';
import 'package:online_shop/models/Product.dart';

import 'category.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child:
              Text("Mini Shop", style: Theme.of(context).textTheme.headline4),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        //     child: GridView.builder(
        //       itemCount: products.length,
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         mainAxisSpacing: kDefaultPaddin,
        //         crossAxisSpacing: kDefaultPaddin,
        //         childAspectRatio: 0.75,
        //       ),
        //       itemBuilder: (context, index) => ItemCard(
        //         product: products[index],
        //         press: () => Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => DetailsScreen(
        //                 product: products[index],
        //               ),
        //             )),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function? press;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPaddin),
            // height: 200,
            // width: 180,
            decoration: BoxDecoration(
              color: product!.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(product!.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            product!.title,
            style: const TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "${product!.price}.000đ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
