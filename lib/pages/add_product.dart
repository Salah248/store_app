import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/post_add_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_feild.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  static String id = 'AddProductPage';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? productName, desk, image, category;

  String? price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Add Product'),
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
                  height: 10,
                ),
                TextFeild(
                  onChanged: (p0) {
                    category = p0;
                  },
                  hintText: 'category',
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
                      await addProductMethod();
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

  Future<void> addProductMethod() async {
    await AddProduct().addProduct(
      titel: productName!,
      price: price!,
      image: image!,
      desc: desk!,
      category: category!,
    );
  }
}
