import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // حجم البطاقة النهائي
    const double cardWidth = 170;
    const double cardHeight = 200;
    // حجم الصورة داخل البطاقة
    const double imageWidth = 100;
    const double imageHeight = 90;
    // مسافة padding داخل البطاقة
    const double paddingAll = 12;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(paddingAll),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // المساحة العلوية للصورة (محاذاة يمين)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.imageUrl,
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const Spacer(flex: 1),
                Text(
                  product.title.length > 15
                      ? '${product.title.substring(0, 15)}...'
                      : product.title,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
