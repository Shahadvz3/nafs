import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shopping_cart.dart';
import 'package:final_project/choice.dart';
import 'ProductCard.dart';
import 'macha.dart';
import 'cups.dart';
import 'machins.dart';
import 'crups.dart';
import 'scale.dart';
import 'FilteringTools.dart';
import 'orderstate.dart';
import 'package:final_project/ProductSearchDelegate.dart';
import 'userInfo.dart';

class HomePage extends StatefulWidget {
  final String userImage; // صورة المستخدم
  final String username; // اسم المستخدم

  HomePage({required this.userImage, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1; // لتتبع الأيقونة النشطة

  // قائمة المنتجات تحت الصورة الأولى
  List<Product> productList1 = [
    Product(
      imageUrl: 'images/scale/sc4.png',
      name: 'ميزان ميني برو MS-R20 PRO',
      description: '',
      price: '33.000 ر.ي',
    ),
    Product(
      imageUrl: 'images/machins/nova.jpg',
      name: 'Cafe Machine',
      description: '',
      price: '6000.000 ر.ي',
    ),
    Product(
      imageUrl: 'images/cups/SlytherinCup.jpg',
      name: 'كوب سليذرين',
      description: '',
      price: '2500 ر.ي',
    ),
    Product(
      imageUrl: 'images/crops/Hadab_yem.png',
      name: ' قهوة يمني حراز - هذب',
      description: '',
      price: '28.000 ر.ي',
    ),
  ];

  // قائمة المنتجات تحت الصورة الثانية
  List<Product> productList2 = [
    Product(
      imageUrl: 'images/macha/machaceremony.png',
      name: ' ماتشا ميرلينبيرد',
      description: '',
      price: '48.000 ر.ي',
    ),
    Product(
      imageUrl: 'images/crops/black_braz.png',
      name: 'قهوة برازيلي / سانتا أنطونيو',
      description: '',
      price: '21.000 ر.ي',
    ),
    Product(
      imageUrl: 'images/macha/set.png',
      name: 'مجموعة أدوات شاي الماتشا الفاخرة',
      description: '',
      price: '40.000 ر.ي',
    ),
    Product(
      imageUrl: 'images/machins/laSpedialist.jpg',
      name: 'آلة قهوة لا سبازيالي',
      description: '',
      price: '988.000 ر.ي',
    ),
    Product(
      imageUrl: 'images/cups/miniCups4.jpg',
      name: 'طقم اكواب صغير',
      description: '',
      price: '20000 ر.ي',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFc8bfb0).withOpacity(0.8),
        elevation: 0,
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Color(0xFF3c485e),
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFFc8bfb0)),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            buildHeaderImage(),
            SizedBox(height: 20),
            buildProductList(productList1, 'احدث المنتجات   '),
            SizedBox(height: 20),
            buildAdditionalImageSection(),
            SizedBox(height: 20),
            buildProductList(productList2, 'الاكثر مبيعًا'),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: buildDrawer(context),
      backgroundColor: Colors.white,
    );
  }

  Widget buildHeaderImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
              image: AssetImage('images/machins.jpeg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }

  Widget buildProductList(List<Product> products, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey, // لون الخط
                  thickness: 2.0, // سمك الخط
                ),
              ),
              SizedBox(width: 8.0), // مساحة بين الخط والنص
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 330, //
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // الاتجاه الأفقي
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductCard(
                  image: product.imageUrl,
                  name: product.name,
                  description: product.description,
                  price: product.price,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildAdditionalImageSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
                image: AssetImage('images/matcha.jpeg'), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      color: Color(0xFFc8bfb0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderStatusPage(
                            orders: [],
                            order: Order,
                          )));
              setState(() {
                _selectedIndex = 0; // تغيير الفهرس النشط
              });
            },
            icon: Icon(Icons.local_shipping,
                color: _selectedIndex == 0 ? Colors.white : Color(0xFF3c485e)),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            userImage: '',
                            username: '',
                          )));
              setState(() {
                _selectedIndex = 1; // تغيير الفهرس النشط
              });
            },
            icon: Icon(Icons.home,
                color: _selectedIndex == 1 ? Colors.white : Color(0xFF3c485e)),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => choicePage()));
              setState(() {
                _selectedIndex = 2; // تغيير الفهرس النشط
              });
            },
            icon: Icon(Icons.account_box_rounded,
                color: _selectedIndex == 2 ? Colors.white : Color(0xFF3c485e)),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
              setState(() {
                _selectedIndex = 4; // تغيير الفهرس النشط
              });
            },
            icon: Icon(
              Icons.shopping_cart,
              color: _selectedIndex == 4 ? Colors.white : Color(0xFF3c485e),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFc8bfb0)),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('images/default_user.png'), // صورة افتراضية
                  radius: 40,
                ),
                SizedBox(height: 8),
                Text(
                  userData.username, // استخدام اسم المستخدم من Provider
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                // يمكنك إضافة بيانات إضافية هنا مثل البريد الإلكتروني
              ],
            ),
          ),
          ListTile(
              title: Text('المحاصيل'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CrupsPage()));
              }),
          ListTile(
              title: Text('معدات القهوة'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MachinesPage()));
              }),
          ListTile(
              title: Text('اكواب'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CupsPage()));
              }),
          ListTile(
              title: Text('ميزان'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScalePage()));
              }),
          ListTile(
              title: Text('ماتشا'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MachaPage()));
              }),
          ListTile(
              title: Text('ادوات ترشيح'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Filteringtools()));
              }),
          ListTile(
              title: Text('الملف الشخصي'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserDataPage()));
              }),
        ],
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}
