import 'package:flutter/material.dart';
import 'ProductCard.dart';
import 'products.dart'; // استيراد ملف المنتجات

class ScalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ميزان'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.42,
        ),
        itemCount: scale.length,
        itemBuilder: (context, index) {
          final product = scale[index];
          return ProductCard(
            image: product.imageUrl,
            name: product.name,
            description: product.description,
            price: product.price,
          );
        },
      ),
    );
  }
}
