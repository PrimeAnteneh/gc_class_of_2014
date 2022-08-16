import 'package:flutter/material.dart';
import 'package:gc_class_of_2014/pages/nav_page.dart';
import 'package:gc_class_of_2014/widgets/my_custom.dart';

import 'pages/character_listing_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despicable Me Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}
