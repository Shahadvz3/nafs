import 'package:flutter/material.dart';
import 'home_page.dart'; // استيراد صفحة الهوم

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    // تأخير لمدة 6 ثوانٍ ثم الانتقال إلى الصفحة الرئيسية
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomePage(
                  username: '',
                  userImage: '',
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3c485e),
      body: Center(
        child: Image.asset(
          'images/logo.png',
          width: 200, // يمكنك تعديل العرض كما تريد
          height: 200, // يمكنك تعديل الارتفاع كما تريد
        ),
      ),
    );
  }
}
