import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';

import 'package:homlisellerapp/app/shared/color.dart';
import 'package:provider/provider.dart';

import 'app/View_Model/personaldetails_controller.dart';
import 'app/routes/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonalDetailscontroller()),

      ],
      child: MaterialApp(
        title: 'Homi Seller',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: RoutesName.Login,
        onGenerateRoute: Routes.getroutes,
      ),
    );
  }
}
