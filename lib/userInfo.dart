import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      backgroundColor: Color(0xFF3c485e),
      appBar: AppBar(
        title: Text(
          'بيانات المستخدم',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF3c485e),
      ),
      body: Center(
        child: Container(
          width: 800, // عرض المربع
          height: 300,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFF3c485e),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserDataRow(
                  'اسم المستخدم: ${userData.username}', context, 'username'),
              _buildUserDataRow(
                  'البريد الإلكتروني: ${userData.email}', context, 'email'),
              _buildUserDataRow('رقم الهاتف: ${userData.phoneNumber}', context,
                  'phoneNumber'),
              _buildUserDataRow('المنطقة: ${userData.area}', context, 'area'),
              _buildUserDataRow(
                  'الحي: ${userData.neighborhood}', context, 'neighborhood'),
              _buildUserDataRow(
                  'الشارع: ${userData.street}', context, 'street'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserDataRow(String label, BuildContext context, String field) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(label,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        IconButton(
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onPressed: () {
            _showEditDialog(context, field);
          },
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context, String field) {
    final userData = Provider.of<UserData>(context, listen: false);
    TextEditingController controller = TextEditingController();

    switch (field) {
      case 'username':
        controller.text = userData.username;
        break;
      case 'email':
        controller.text = userData.email;
        break;
      case 'phoneNumber':
        controller.text = userData.phoneNumber;
        break;
      case 'area':
        controller.text = userData.area;
        break;
      case 'neighborhood':
        controller.text = userData.neighborhood;
        break;
      case 'street':
        controller.text = userData.street;
        break;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تعديل البيانات'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: 'أدخل القيمة الجديدة',
                filled: true,
                fillColor: Colors.grey[200]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // تحديث القيمة في UserData
                switch (field) {
                  case 'username':
                    userData.updateUserData(
                        username: controller.text,
                        email: userData.email,
                        phoneNumber: userData.phoneNumber,
                        area: userData.area,
                        neighborhood: userData.neighborhood,
                        street: userData.street);
                    break;
                  case 'email':
                    userData.updateUserData(
                        username: userData.username,
                        email: controller.text,
                        phoneNumber: userData.phoneNumber,
                        area: userData.area,
                        neighborhood: userData.neighborhood,
                        street: userData.street);
                    break;
                  case 'phoneNumber':
                    userData.updateUserData(
                        username: userData.username,
                        email: userData.email,
                        phoneNumber: controller.text,
                        area: userData.area,
                        neighborhood: userData.neighborhood,
                        street: userData.street);
                    break;
                  case 'area':
                    userData.updateUserData(
                        username: userData.username,
                        email: userData.email,
                        phoneNumber: userData.phoneNumber,
                        area: controller.text,
                        neighborhood: userData.neighborhood,
                        street: userData.street);
                    break;
                  case 'neighborhood':
                    userData.updateUserData(
                        username: userData.username,
                        email: userData.email,
                        phoneNumber: userData.phoneNumber,
                        area: userData.area,
                        neighborhood: controller.text,
                        street: userData.street);
                    break;
                  case 'street':
                    userData.updateUserData(
                        username: userData.username,
                        email: userData.email,
                        phoneNumber: userData.phoneNumber,
                        area: userData.area,
                        neighborhood: userData.neighborhood,
                        street: controller.text);
                    break;
                }
                Navigator.of(context).pop();
              },
              child: Text('تأكيد'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
          ],
        );
      },
    );
  }
}

class UserData with ChangeNotifier {
  String username = '';
  String email = '';
  String phoneNumber = '';
  String area = '';
  String neighborhood = '';
  String street = '';

  void updateUserData({
    required String username,
    required String email,
    required String phoneNumber,
    required String area,
    required String neighborhood,
    required String street,
  }) {
    this.username = username;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.area = area;
    this.neighborhood = neighborhood;
    this.street = street;
    notifyListeners();
  }
}
