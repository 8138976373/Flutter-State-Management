import 'package:flutter/material.dart';
import 'package:flutter_state_management/GetX/views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ViewDetails(title :'GetX App',scrollDirection: Axis.vertical),
      debugShowCheckedModeBanner: false,
    );
  }
}
