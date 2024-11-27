import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'sign_up.dart';

class choicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3c485e), // اللون الأول
              Color(0xFF4e596d), // اللون الثاني
            ],
            begin: Alignment.topCenter, // نقطة البداية (الأعلى)
            end: Alignment.bottomCenter, // نقطة النهاية (الأسفل)
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // صورة في المركز
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'images/logo2.png',
                  height: 250,
                  width: 250,
                ),
              ),

              // قائمة الخيارات
              Column(
                children: [
                  SelectionButton(
                    text: 'تسجيل دخول',
                    context: context,
                  ),
                  SelectionButton(
                    text: 'تسجيل',
                    context: context,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // زر العودة إلى الصفحة الرئيسة
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'العودة إلى الصفحة الرئيسية',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFFc8bfb0),
                  backgroundColor: Color(0xFF4e596d),
                ),
                // لون النص في الزر
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ويدجت زر الاختيار مع الشكل المقوس
class SelectionButton extends StatelessWidget {
  final String text;
  final BuildContext context;

  const SelectionButton({required this.text, required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // شكل مقوس
          boxShadow: [
            BoxShadow(
              color: Colors.black38, // لون الظل
              offset: Offset(0, 4), // موضع الظل
              blurRadius: 6, // مدى البلور
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // التحقق من الخيار المحدد
            if (text == 'تسجيل دخول') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else if (text == 'تسجيل') {
              // شرط جديد للتسجيل
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SignUpPage()), // استبدل RegistrationPage بصفحة التسجيل الخاصة بك
              );
            }
          },
          child: Text(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xFF3c485e),
            backgroundColor: Color(0xFFc8bfb0),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: TextStyle(
              fontSize: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
