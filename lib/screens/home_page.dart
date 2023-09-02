import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/all_products_service.dart';
import 'package:store/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductService().getAllProduct(),
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               List<ProductModel> products=snapshot.data!;
               return GridView.builder(
                 itemCount: products.length,
                 clipBehavior: Clip.none,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 1.5,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 95,
                 ),
                 itemBuilder: (context, index) {
                   return CustomCard(product: products[index],);
                 },
               );
             }else{
               return Center(
                 child: CircularProgressIndicator(),
               );
             }
           },
          ),
        ));
  }
}
