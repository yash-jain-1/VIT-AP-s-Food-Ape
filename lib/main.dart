import 'package:flutter/material.dart';
import 'package:food_ape_3/screens/cart.dart';
import 'package:food_ape_3/screens/info.dart';
import 'package:food_ape_3/screens/notification.dart';
import 'package:food_ape_3/screens/profile.dart';
import 'package:food_ape_3/utils/bottomNavBar.dart';
import 'package:food_ape_3/utils/constants.dart';
import 'package:food_ape_3/utils/foodCard.dart';
import 'package:gsheets/gsheets.dart';
import 'package:food_ape_3/screens/fs.dart';
import 'package:food_ape_3/screens/mess.dart';


// Your Google Sheets credentials
const cred = r'''
{
  "type": "service_account",
  "project_id": "food-ape-404020",
  "private_key_id": "146b811c56fa446fc35c0c10b896b28e87cff1e8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC+Mpcsu8UAQlZQ\nBdUIxyDO5WeHNG+TobyL5f/lxywTvFYTn2fIkmBI852u4nP3aaJolhkIpFueOnxv\ndOBVY3zj95gLHtZPJzr/7Fe9jzf2q5hHOdokix7S8wF2rpSriV1Tl5pq1IkOHXlQ\nPZJcGf5sdZiICwxJUAqgJswJo9fhyEyKf+GkSl0N1kbs2E2+exDi0mQKPdMLCen7\nyRtQecBHjxZLYdXX7Cr7xLGva2LRJEucR9rpNReFT3A7to2Yk7dPbB63/gI4/2ck\nQ2bZ+MR9ToWcGO4SgjYWyx9j6FcemRTTgbX6w6DGFV5urHsJLzRaqcp2WhQAMuYT\nis7JS1SDAgMBAAECggEAIPbGsbeXdKyKphLkscFFY+Zpk4rYfbdN5NdHiy0CbCc7\nqen6RE5uRqaGYT2ZSLuzrLm6+/70bA+J6o1Qpiv4hNAwN1kwXoaXmKx/Jnjwg52I\n5mtV7fh4rqn0SnwGg1Zq6OaBGlvcpygfkvMg7zqIGIcnGQkFJ52qQciHm3Ico+JU\nkGgnI/G8Zbhjhg59EukZr+kwaf70TPP3+m4y0TSmc1cesR3fALJl9SCph4gbxQ+v\naJc/jiEda3QV+tVCRiuGpjMg6oBkOMt/G9vmt+zkFe6EsRyrigge1zjqpFFdphRk\n2+P5yKt6Jow5PHA+YYXwa1c4QGF8OsQj/XfnXNl4nQKBgQD7jp5Wrn570jbGZxbI\nbByKS1xH8Mcpdc1qkQYcJo0XMsU9ZcWHwo7PzS14gmODS+zdKAo59tJxo4Hm72SC\nysvc5tg7ZrsIzsmN72tOAQDQtoGkL+FWI1KQfiRXi9cq8B7arALjVOyYJc22SkKr\n4ya7G458/rrX+PzSHmtF+RPB5wKBgQDBjosbmMXX2MOdLldfzyjFHMFHT/D4cjeY\n4zDGUDeyphz0wpLTNCdw/LMiIzN0hxxaPgtMMdlbAjZxGu8V+//up2tOKwTGbebU\n7WueeBXwZltoxdrKAnbE3Dzarj9PGw9Rk4kyn5dMvGYtqoQXv9OT6gWYpCEtCNwF\nVst4hhe9BQKBgBU/1uA7nTOYbkgULTiA6WhFNWZeUHSQHuoBliKKnyB2iXLGRglR\nxf6Htm+XlBBjOX71AugikWRIC5EWZ8ckmlPurBVYeDQmQ6BZuRa9vvPidtEHumEs\nWq0Z+rfqeCKIZhLStOu/IL05dEcRvtAGQB9OFJs6aU4VGkYli6o9gA3BAoGAOz0/\nQhD97FQBeqfmQgKLPdjRJtxGqiN69KYEFY4Tne/NSPQML+v0blZJFRek9fMsMEpw\n9r8DASGqO++8YQQhjo9a/i+YZIrabSzFFVk3jb4mF+kGT3F1nEazsVJHOhTUGWmI\nQiAqFGhM9YkMqKAjR1AGqnMBXGErxc6Ms7SGq2kCgYBTw4ENEbOdng8lcxVCMNYW\nXpnCF8xyP4IcJxDpZscAk1AyV+PUnEZzk+ait16SxtgXiq98+JcE2E0g6JRsJ23Z\nqlf1515AJF7VPnkkhfvovneehEsFomfuMn4oMEs+a9bFojQhy037T+Ifvc1wCIKw\nmwFhzNUhtTMUsBf2CVwtxQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "food-ape@food-ape-404020.iam.gserviceaccount.com",
  "client_id": "109342418297392484215",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/food-ape%40food-ape-404020.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

// Your Google Sheets spreadsheet ID
const spreadsheetID = '1ZBca-NZ5V_N0NwJ5t5Y5dpb5XFCZqRQYAXddU77M07U';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final gsheets = GSheets(cred);
  final ss = await gsheets.spreadsheet(spreadsheetID);
  var sheet = ss.worksheetByTitle('NovSpl');
  var sheet2 = ss.worksheetByTitle('NovVeg_NonVeg');
  final data = await sheet?.values.map.allRows() ?? [];
  final data2 = await sheet2?.values.map.allRows() ?? [];

  runApp(FoodApp(data: data, data2: data2));
}

class FoodApp extends StatelessWidget {
  final List<Map<String, String>> data;
  final List<Map<String, String>> data2;

  FoodApp({required this.data, required this.data2});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(data: data, data2: data2),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
     

    );
  }
}

class HomePage extends StatefulWidget {
  final List<Map<String, String>> data;
  final List<Map<String, String>> data2;

  HomePage({required this.data, required this.data2});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late List<Widget> _pages;
  final Cart cart = Cart();
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    _pages = [
      MessPage(data: widget.data, data2: widget.data2),
      FoodStreetPage(),
      CartScreen(cart: cart),
      ProfilePage(),
      // DeveloperInfoPage(
      //   developerName: 'Yash Jain',
      //   developerBio:
      //       'I am a computer science student at VIT-AP University. I love coding and learning new things. In my free time, I enjoy playing video games and watching movies.',
      //   appDescription:
      //       'This app was created as a project for Design Thinking.',
      // ),
      NotificationPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color.fromARGB(168, 50, 50, 50),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.orange,
        shadowColor: Color.fromARGB(0, 172, 172, 172),
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        title: Text('Food Ape'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 142, 140, 140).withOpacity(0.1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),),
              ),
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeveloperInfoPage(
                    developerName: 'Yash Jain',
                    developerBio:
                        'I am a computer science student at VIT-AP University. I love coding and learning new things. In my free time, I enjoy playing video games and watching movies.',
                    appDescription:
                        'This app was created as a project for Design Thinking.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(children: [_pages[_currentIndex],
      Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none, children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(backgroundColor: Colors.orange, child: Icon(Icons.shopping_basket_rounded), elevation: 0.1, onPressed: () {
                      _currentIndex = 2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(cart: cart),
                      ),
                    );
                    }),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: currentIndex == 0 ? Colors.orange : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                            // display mess instead of food street
                            _currentIndex = 0;
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.restaurant_menu,
                              color: currentIndex == 1 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                              // display food street instead of mess
                              _currentIndex = 1;
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.person_2_rounded,
                              color: currentIndex == 2 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                              
                              // go to profile page
                              _currentIndex = 3;  
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: currentIndex == 3 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                              // go to info page
                              _currentIndex = 4;
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )]),
      // bottomNavigationBar: BottomNavBarV2()
    );
  }
}


class Cart {
  List<CartItem> items = [];

  void addToCart(CartItem item) {
    items.add(item);
  }

  void removeFromCart(CartItem item) {
    items.remove(item);
  }

  double getTotalPrice() {
    return items.fold(0.0, (sum, item) => sum + double.parse(item.price));
  }
}

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.asset(item.image, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text('\$${item.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                cart.removeFromCart(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item removed from the cart'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.addToCart(item);
                        //close the snackbar

                      },
                    ),
                    animation: CurvedAnimation(
                      parent: AlwaysStoppedAnimation(1),
                      curve: Curves.easeInOut,
                    )
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total:  ${cart.getTotalPrice()}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class FoodStreetPage extends StatelessWidget {

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackColor,
      body: ListView(
        children: [
          FoodCard(
          name: 'Pizza',
          description: 'Delicious pizza with toppings',
          price: '10.99',
          image: 'assets/images/pizza.jpg',
          shop: 'Pizza Paradise',
          cart: cart,
        ),
          FoodCard(
            name: 'Taco Platter',
            description: 'Assorted tacos with salsa and guacamole.',
            price: '12.99',
            image: 'assets/images/apple_pie.jpg',
            shop: 'Taco Bell',
            cart: cart  ,
          ),
          FoodCard(
            name: 'Burger and Fries',
            description: 'Delicious with sauce and Cola.',
            price: '9.99',
            image: 'assets/images/hamburger.jpg',
            shop: 'Burger King',
            cart: cart,
          ),
          FoodCard(
            name: 'Margherita Pizza',
            description: 'Classic pizza with tomato and mozzarella.',
            price: '11.99',
            image: 'assets/images/pizza.jpg',
            shop: 'Pizza Hut',
            cart: cart,
          ),
          // Add more FoodCard widgets for other items
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = const Color.fromARGB(255, 24, 24, 24)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}