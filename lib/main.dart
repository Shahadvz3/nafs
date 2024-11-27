import 'package:final_project/userInfo.dart';
import 'package:flutter/material.dart';
import 'logo_page.dart'; // استيراد صفحة الشعار
import 'package:provider/provider.dart';
import 'shopping_cart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
        // موفري بيانات آخرين...
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogoPage(),
    );
  }
}
