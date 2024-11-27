import 'package:flutter/material.dart';
import 'package:final_project/ProductDetails.dart';
import 'package:final_project/shopping_cart.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  final Color borderColor;

  ProductCard({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.borderColor = const Color(0xFFc8bfb0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // استخدام Container بدون لون خلفية
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2.0), // تحديد لون الحواف
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                image: image,
                name: name,
                description: description,
                price: price,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white, // لون النص باللون الأبيض
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white, // لون النص باللون الأبيض
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(
                            CartItem(
                              image: image,
                              name: name,
                              description: description,
                              price: price,
                            ),
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم إضافة $name إلى السلة')),
                      );
                    },
                    child: Text('أضف للسلة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
