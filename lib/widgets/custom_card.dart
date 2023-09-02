import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product.dart';
class CustomCard extends StatelessWidget {
    CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);
   ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProduct.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 20,
                offset: Offset(1, 1),
              )
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0,6),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right:20,
            top: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}