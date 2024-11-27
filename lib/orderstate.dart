import 'package:flutter/material.dart';

class OrderStatusPage extends StatelessWidget {
  final List<Order> orders;

  OrderStatusPage({required this.orders, required order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حالة الطلبات'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: orders.isEmpty
            ? Center(
                child: Text(
                  'لا توجد طلبات حالياً.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('رقم الطلب: ${order.orderId}'),
                      subtitle: Text(
                          'تاريخ الطلب: ${order.orderDate} - الحالة: ${order.status}'),
                      onTap: () {
                        // يمكنك إضافة دالة لعرض تفاصيل الطلب هنا
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

// نموذج الطلب
class Order {
  final String orderId;
  final String orderDate;
  final String customerName;
  final String customerEmail;
  final String status;
  final List<OrderItem> items;
  final double totalAmount;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.customerName,
    required this.customerEmail,
    required this.status,
    required this.items,
    required this.totalAmount,
  });
}

// نموذج عنصر الطلب
class OrderItem {
  final String image;
  final String name;
  final String price;
  final int quantity;

  OrderItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}
