import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../View/Login_view.dart';
import '../View/PersonalDetails.dart';
import '../View/Sales-Report.dart';
import '../View/ShopDetails.dart';
import '../View/home_view.dart';
import '../View/registration_view.dart';
import 'RoutesName.dart';
class Routes{

  static Route<void> getroutes(RouteSettings setting){
    switch(setting.name){
      case RoutesName.REGISTRATION:
        return MaterialPageRoute(builder: (context)=>RegistrationView());

      case RoutesName.Login:
        return MaterialPageRoute(builder: (context)=>LoginView());

        case RoutesName.PersonalDetails:
        return MaterialPageRoute(builder: (context)=>PersonalDetails());

        case RoutesName.ShopDetails:
        return MaterialPageRoute(builder: (context)=>ShopDetails());

        case RoutesName.SalesReport:
        return MaterialPageRoute(builder: (context)=>SalesReport());


      default:
        return MaterialPageRoute(builder: (context)=>HomeView());
    }
  }
}