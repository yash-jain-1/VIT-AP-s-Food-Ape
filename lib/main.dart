import 'package:flutter/material.dart';
import 'package:food_ape_3/cart.dart';
import 'package:food_ape_3/info.dart';
import 'package:food_ape_3/profile.dart';
import 'package:gsheets/gsheets.dart';

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
  final data = await sheet?.values.map.allRows() ?? [];

  runApp(FoodApp(data: data));
}

class FoodApp extends StatelessWidget {
  final List<Map<String, String>> data;

  FoodApp({required this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(data: data),
      theme: ThemeData.dark(
        
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Map<String, String>> data;

  HomePage({required this.data});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MessPage(data: widget.data),
      FoodStreetPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 182, 12, 0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(
                cart: Cart(),
              ),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
        title: Text('Food Ape'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
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
                    appDescription: 'This app was created as a project for Design Thinking.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromARGB(255, 182, 12, 0),
        unselectedLabelStyle: TextStyle(
          color: const Color.fromARGB(255, 182, 12, 0),
        ),
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: const Color.fromARGB(255, 182, 12, 0),
        ),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Mess',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food Street',
          ),
        ],
      ),
    );
  }
}

class MessPage extends StatelessWidget {
  final List<Map<String, String>> data;

  MessPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(data[index]['DAYS'].toString()),
                  subtitle: Column(
                    children: [
                      Text("BREAKFAST", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data[index]['BREAK FAST'].toString()),
                      SizedBox(height: 10,),
                      Text("LUNCH", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data[index]['LUNCH'].toString()),
                      SizedBox(height: 10,),
                      Text("SNACKS", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data[index]['SNACKS'].toString()),
                      SizedBox(height: 10,),
                      Text("DINNER", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data[index]['DINNER'].toString()),
                    ],
                  ),
              
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FoodStreetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Street', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
      ),
      body: ListView(
        children: [
          FoodCard(
            name: 'Sushi Platter',
            description: 'Fresh sushi selection with soy sauce.',
            price: '\₨15.99',
            image: 'assets/images/rice.jpg',
            shop: 'Puri Vuri',
          ),
          FoodCard(
            name: 'Taco Platter',
            description: 'Assorted tacos with salsa and guacamole.',
            price: '\₨12.99',
            image: 'assets/images/apple_pie.jpg',
            shop: 'Taco Bell',
          ),
          FoodCard(
            name: 'Burger and Fries',
            description: 'Delicious with sauce and Cola.',
            price: '\₨9.99',
            image: 'assets/images/hamburger.jpg',
            shop: 'Burger King',
          ),
          FoodCard(
            name: 'Margherita Pizza',
            description: 'Classic pizza with tomato and mozzarella.',
            price: '\₨11.99',
            image: 'assets/images/pizza.jpg',
            shop: 'Pizza Hut',
          ),
          // Add more FoodCard widgets for other items
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;
  final String shop;

  FoodCard({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(shop, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Image.asset(image, fit: BoxFit.cover),
          ListTile(
            title: Text(name),
            subtitle: Text(description),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press to add item to cart
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
