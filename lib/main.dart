import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';

import 'package:homlisellerapp/app/shared/color.dart';

import 'app/routes/Routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
        // home: const SignUpView(),
        
        debugShowCheckedModeBanner: false,
        title: "homlisellerapp",
        initialRoute: RoutesName.Login,
        onGenerateRoute: Routes.getroutes,

        

        theme: ThemeData(
            fontFamily: 'poppins',
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ),
            appBarTheme:
                AppBarTheme(backgroundColor: FixedColors.blue, elevation: 0),
            textTheme: const TextTheme(button: TextStyle(color: Colors.white)),
            iconTheme: const IconThemeData(color: Colors.blue),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            )),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                      color: Colors.blue[300]!,
                    )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue[300]!,
                        ),
                        borderRadius: BorderRadius.circular(10))))),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 16)),
                    fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.blue))))),

  );
}
