import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// تعريف كلاس CartItem
class CartItem {
  final String image;
  final String name;
  final String description;
  final String price; // نص السعر مع العملة
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}

// تعريف كلاس CartProvider
class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    int index = _cartItems.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (total, item) {
      final price = double.tryParse(item.price.replaceAll(' ر.ي', '').trim());
      return total + (price ?? 0) * item.quantity;
    });
  }
}

// دالة لعرض عنصر السلة
Widget cartItemWidget(BuildContext context, CartItem item, int index) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        context.read<CartProvider>().decreaseQuantity(index);
                      },
                    ),
                    Text(
                      item.quantity.toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        context.read<CartProvider>().increaseQuantity(index);
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<CartProvider>().removeItem(index);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  'السعر: ${item.price}', // أعرض السعر مع العملة
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// صفحة السلة
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;
    final totalPrice = context.watch<CartProvider>().totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('سلة التسوق'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('لا توجد عناصر في السلة'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return cartItemWidget(context, cartItems[index], index);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إجمالي الطلب: ${totalPrice.toStringAsFixed(2)} ر.ي',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showConfirmationDialog(context);
                        },
                        child: Text('إتمام الطلب'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تأكيد الطلب'),
          content: Text('هل أنت متأكد من إتمام الطلب؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // إغلاق الحوار
              child: Text('لا'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الحوار
                _showSuccessMessage(context); // عرض رسالة النجاح
              },
              child: Text('نعم'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Expanded(child: Text('تم الطلب بنجاح!')),
          ],
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
