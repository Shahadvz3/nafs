import 'package:flutter/material.dart';
import 'ProductCard.dart';
import 'products.dart'; // استيراد ملف المنتجات

class MachaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ماتشا'),
        backgroundColor: Color(0xFFc8bfb0),
      ),
      body: Container(
        color: Color(0xFF3c485e),
        child: GridView.builder(
          padding: EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.42,
          ),
          itemCount: matcha.length,
          itemBuilder: (context, index) {
            final product = matcha[index];
            return ProductCard(
              image: product.imageUrl,
              name: product.name,
              description: product.description,
              price: product.price,
            );
          },
        ),
      ),
    );
  }
}
