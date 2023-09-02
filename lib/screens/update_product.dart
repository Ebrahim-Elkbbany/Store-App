import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/all_products_service.dart';
import 'package:store/services/update_product_service.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_snackBar.dart';
import 'package:store/widgets/custom_textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({Key? key}) : super(key: key);
  static String id = 'UpdateProduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, description, image;
   bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              
              children: [
                const SizedBox(
                  height: 120,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: 'description', 
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                const SizedBox(height: 40),
                CustomButton(
                  buttonName: 'Update',
                  boxDecorationColor: Colors.blue,
                  textColor: Colors.white,
                  onTap: () async{
                    isLoading=true;
                    setState(()  {

                    });

                    try {
                      updateProduct(product);
                      showSnackBar(context, 'success');
                    }  catch (e) {
                      showSnackBar(context, e.toString());
                    }

                    isLoading=false;
                    setState(() {

                    });
                  },

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
  await  UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price ?? product.price.toString(),
      description: description == null ? product.description : description!,
      image: image ==null ? product.image : image!,
      category: product.category,
      id: product.id.toString(),

    );
    AllProductService().getAllProduct();
  }
}
