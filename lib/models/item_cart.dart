import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product? product;
  final void Function()? press;
  const ItemCard({
    Key? key,
    this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
