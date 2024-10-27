// ignore_for_file: missing_required_param

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String titel,
    required String price,
    required String image,
    required String desc,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': titel,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );

    return ProductModel.fromJson(data);
  }
}
