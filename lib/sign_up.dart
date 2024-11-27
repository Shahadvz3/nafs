import 'package:final_project/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'userInfo.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String phoneNumber = '';
  String area = '';
  String neighborhood = '';
  String street = '';
  String email = '';
  String emailDomain = 'gmail.com';

  final List<String> emailDomains = [
    'gmail.com',
    'hotmail.com',
    'yahoo.com',
    'icloud.com',
  ];

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    final regex = RegExp(r'^(73|77|78|70|71)\d{7}$');
    if (!regex.hasMatch(value)) {
      return 'رقم الهاتف يجب أن يبدأ بـ 73 أو 77 أو 78 أو 70 أو 71';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    return null;
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('موافق'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      final userData = Provider.of<UserData>(context, listen: false);
      userData.updateUserData(
        username: username,
        email: '$email@$emailDomain', // دمج اسم المستخدم مع النطاق
        phoneNumber: phoneNumber,
        area: area,
        neighborhood: neighborhood,
        street: street,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            userImage: '',
            username: '',
          ), // انتقل إلى الصفحة الرئيسية
        ),
      );
    } else {
      showErrorDialog('يرجى تصحيح الأخطاء في النموذج.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3c485e), // لون الخلفية
      appBar: AppBar(
        title: Text('صفحة التسجيل'),
        backgroundColor: Color(0xFF3c485e),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // الرجوع إلى الصفحة السابقة
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFF3c485e),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3), // تغيرات الظل
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('images/logo.png', height: 150),
                  SizedBox(height: 20),
                  _buildTextField(
                    label: 'اسم المستخدم',
                    icon: Icons.person,
                    hint: 'أدخل اسم المستخدم',
                    onChanged: (value) => username = value,
                    validator: (value) =>
                        value!.isEmpty ? 'اسم المستخدم مطلوب' : null,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  _buildTextField(
                    label: 'كلمة المرور',
                    icon: Icons.lock,
                    hint: 'أدخل كلمة المرور',
                    obscureText: true,
                    onChanged: (value) => password = value,
                    validator: (value) =>
                        value!.isEmpty ? 'كلمة المرور مطلوبة' : null,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  _buildTextField(
                    label: 'رقم الهاتف',
                    icon: Icons.phone,
                    hint: 'أدخل رقم الهاتف',
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => phoneNumber = value,
                    validator: validatePhone,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  _buildTextField(
                    label: 'المنطقة',
                    icon: Icons.location_on,
                    hint: 'أدخل المنطقة',
                    onChanged: (value) => area = value,
                    validator: (value) =>
                        value!.isEmpty ? 'المنطقة مطلوبة' : null,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  _buildTextField(
                    label: 'الحي',
                    icon: Icons.home,
                    hint: 'أدخل الحي',
                    onChanged: (value) => neighborhood = value,
                    validator: (value) => value!.isEmpty ? 'الحي مطلوب' : null,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  _buildTextField(
                    label: 'الشارع',
                    icon: Icons.streetview,
                    hint: 'أدخل الشارع',
                    onChanged: (value) => street = value,
                    validator: (value) =>
                        value!.isEmpty ? 'الشارع مطلوب' : null,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  DropdownButtonFormField<String>(
                    value: emailDomain,
                    decoration: InputDecoration(
                      labelText: 'اختر نطاق البريد الإلكتروني',
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: emailDomains.map((String domain) {
                      return DropdownMenuItem<String>(
                        value: domain,
                        child:
                            Text(domain, style: TextStyle(color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        emailDomain = value!;
                      });
                    },
                    validator: (value) => value == null
                        ? 'يرجى اختيار نطاق البريد الإلكتروني'
                        : null,
                  ),
                  SizedBox(height: 16), // مسافة بين الحقول
                  _buildTextField(
                    label: 'اسم المستخدم (بدون النطاق)',
                    icon: Icons.mail,
                    hint: 'أدخل اسم المستخدم',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => email = value,
                    validator: validateEmail,
                  ),
                  SizedBox(height: 20), // مسافة إضافية قبل الزر
                  ElevatedButton(
                    onPressed: register,
                    child: Text('تسجيل'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF3c485e),
                      backgroundColor: Color(0xFFc8bfb0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black), // لون الأيقونة
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black54), // لون النص التلميحي
        labelStyle: TextStyle(color: Colors.black), // لون النص
        filled: true,
        fillColor: Colors.white, // لون الحقل أبيض
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.black), // لون النص المدخل
      onChanged: onChanged,
      validator: validator,
    );
  }
}
