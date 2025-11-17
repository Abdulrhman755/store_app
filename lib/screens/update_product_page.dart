import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static const String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  inputType: TextInputType.number,
                  hintText: 'Price',
                  onChanged: (data) {
                    price = (data);
                  },
                ),
                SizedBox(height: 50),
                CustomButton(
                  text: 'Update',

                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await updateProduct(product);
                      debugPrint('Product Updated');
                    } catch (e) {
                      debugPrint('Error: ${e.toString()}');
                    } finally {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 7. 👈 (إصلاح) تحويل الدالة إلى async وتُعيد Future
  Future<void> updateProduct(ProductModel product) async {
    // 8. 👈 (إصلاح) انتظار (await) الخدمة
    await UpdateProductService().updateProduct(
      // 9. 👈 (إصلاح) تمرير الـ ID للخدمة
      id: product.id,
      title: productName == null ? product.title : productName!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.imageUrl : image!,
      price: price == null ? product.price.toString() : price!,
      category: product.category,
    );
  }
}
