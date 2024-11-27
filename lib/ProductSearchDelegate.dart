import 'package:flutter/material.dart';
import 'products.dart'; // تأكد من استيراد ملف المنتجات

class ProductSearchDelegate extends SearchDelegate<Product?> {
  List<Product> results = []; // قائمة لتخزين النتائج

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          results.clear(); // مسح النتائج عند مسح النص
          showSuggestions(context); // عرض الاقتراحات
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final allProducts = [...machins];

    // البحث عن النتائج المطابقة
    results = allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // إذا لم توجد نتائج، عرض رسالة
    if (results.isEmpty) {
      return Center(child: Text('لا توجد نتائج مطابقة.'));
    }

    // عرض قائمة النتائج
    return buildResultsList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // هنا يمكنك إرجاع عنصر فارغ أو قائمة بالاقتراحات
    // لكن في هذه الحالة، ليس هناك حاجة لفعل شيء هنا
    return Container(); // يمكنك تعديل هذا حسب الحاجة
  }

  Widget buildResultsList(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.asset(product.imageUrl, width: 50, height: 50),
          title: Text(product.name),
          subtitle: Text(product.description),
          trailing: Text(product.price),
          onTap: () {
            // التعامل مع ضغط المنتج (مثل الانتقال إلى تفاصيل المنتج)
          },
        );
      },
    );
  }

  @override
  void showSuggestions(BuildContext context) {
    // تحديث النتائج عند الكتابة
    buildResults(context);
    super.showSuggestions(context);
  }
}
