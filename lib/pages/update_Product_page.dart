// ignore_for_file: file_names, unused_catch_clause, avoid_print

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/put_update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desk, image;

  String? price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Update Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextFeild(
                  onChanged: (p0) {
                    productName = p0;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFeild(
                  onChanged: (p0) {
                    desk = p0;
                  },
                  hintText: 'description',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFeild(
                  onChanged: (p0) {
                    price = p0;
                  },
                  hintText: 'price',
                  inpuType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFeild(
                  onChanged: (p0) {
                    image = p0;
                  },
                  hintText: 'image',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProductMethod(product);
                      print('success');
                    } on Exception catch (e) {
                      print(e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id,
      titel: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      image: image == null ? product.image : image!,
      desc: desk == null ? product.description : desk!,
      category: product.category,
    );
  }
}
