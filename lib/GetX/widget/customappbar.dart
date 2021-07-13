
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  final Size preferredSize =Size.fromHeight( 100); // default is 56.0

  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
          ),
          // border: Border.all(
          //   // width: 3,
          //   color: Colors.white,
          //   style: BorderStyle.solid,
          // ),
          gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),
            )),
      ),
      backgroundColor: Colors.white,
      toolbarHeight: MediaQuery.of(context).size.height / 4,
      // title:
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.vertical(
          bottom: new Radius.elliptical(50, 50),
        ),
      ),
    );
  }
}