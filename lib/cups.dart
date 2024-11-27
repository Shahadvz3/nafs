import 'package:flutter/material.dart';
import 'ProductCard.dart';
import 'products.dart'; // استيراد ملف المنتجات

class CupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اكواب'),
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
          itemCount: cups.length,
          itemBuilder: (context, index) {
            final product = cups[index];
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
