import 'package:flutter/material.dart';
import 'package:food_ape_3/utils/appBar.dart';

var kThemeColor = const Color.fromARGB(255, 182, 12, 0);
var kAppBar = CustomAppBar(height: 20, title: Text(""), leading: IconButton(onPressed: (){}, icon: Icon(Icons.abc_outlined),), actions: [IconButton(onPressed: (){}, icon: Icon(Icons.abc_outlined),)]);
var kProfileImage = Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    border: Border.all(
      color: Colors.grey,
      width: 2,
    ),
    shape: BoxShape.circle,
  ),
  child: CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/images/profile.jpg'),
  ),
);
ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    iconTheme: IconThemeData(
      color: Colors.amberAccent
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[800],
      titleTextStyle: TextStyle(
          color: Colors.amber,
        fontWeight: FontWeight.bold,
        fontSize: 20
      )
    ),
    hintColor: Colors.brown,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amberAccent,
      textTheme: ButtonTextTheme.accent
    )
  );

  ThemeData _lightTheme = ThemeData(
      brightness: Brightness.light,
      iconTheme: IconThemeData(
          color: Colors.blueAccent
      ),
      primaryColor: Colors.blue,
      hintColor: Colors.white,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.normal
      )
  );

bool lightMode = true;
final kBackColor = Color.fromARGB(168, 50, 50, 50);
