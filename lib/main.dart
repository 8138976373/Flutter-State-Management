import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/provider/views/homepage.dart';
import 'package:provider/provider.dart';
import 'Bloc/cubit/homecubit.dart';
import 'Bloc/views/homepage.dart';
import 'provider/views/homepage.dart';

import 'package:flutter_state_management/GetX/views/homepage.dart';

import 'provider/notifiers/itemaddnotifier.dart';


void main() {
  runApp(MyApp());
}

// Block Main Page

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(title: 'Bloc App ', scrollDirection: Axis.vertical,), debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// GetX Main Page
//
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

// Provider Main Page

// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ItemAddNotifier>(
//       create: (BuildContext context) {
//         return ItemAddNotifier();
//       },
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomePageProvider(scrollDirection: Axis.vertical,title: 'Provider App',)
//       ),
//     );
//   }
// }
