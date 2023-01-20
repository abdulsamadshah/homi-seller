
import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/View/product_view.dart';
import 'package:homlisellerapp/app/View/profile_view.dart';
import 'package:homlisellerapp/app/View/registration_view.dart';
import 'package:homlisellerapp/app/View/seller_details_view.dart';
import 'package:homlisellerapp/app/View/seller_store_form.dart';

import 'Login_view.dart';
import 'PersonalDetails.dart';
import 'ShopDetails.dart';
import 'edit_profile_one.dart';
import 'edit_profile_two.dart';
import 'home_view.dart';
import 'khazana_views/khazana_food_one.dart';
import 'khazana_views/khazana_food_two.dart';
import 'khazana_views/khazana_form_one_view.dart';
import 'khazana_views/khazana_form_two_view.dart';
import 'order_detail_one_view.dart';
import 'order_list_view.dart';
class allscreeen extends StatefulWidget {
  const allscreeen({Key? key}) : super(key: key);

  @override
  State<allscreeen> createState() => _allscreeenState();
}

class _allscreeenState extends State<allscreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          height: 1200,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                      }, child: Text('Login')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationView()));
                      }, child: Text('RegistrationView')),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopDetails()));
                      }, child: Text('ShopDetails')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerStoreFormeOne()));
                      }, child: Text('SellerStoreFormeOne')),
                    ),
                  ],
                ),


                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerDetail()));
                      }, child: Text('SellerDetail')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                      }, child: Text('ProfileView')),
                    ),
                  ],
                ),


                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductView()));
                      }, child: Text('ProductView')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetails()));
                      }, child: Text('PersonalDetails')),
                    ),
                  ],
                ),


                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListView()));
                      }, child: Text('OrderListView')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailOneView()));
                      }, child: Text('OrderDetailOneView')),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
                      }, child: Text('HomeView')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileTwo()));
                      }, child: Text('EditProfileTwo')),
                    ),
                  ],
                ),


                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>KhazanaFoodOne()));
                      }, child: Text('KhazanaFoodOne')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>KhazanaFoodTwo()));
                      }, child: Text('KhazanaFoodTwo')),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>KhazanaFormOneView()));
                      }, child: Text('KhazanaFormOneView')),
                    ),

                    SizedBox(width: 20,),
                    Container(
                      width: 180,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>KhazanaFormTwoView()));
                      }, child: Text('KhazanaFormTwoView')),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter DropDownButton',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const MyHomePages(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePages extends StatefulWidget {
//   const MyHomePages({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePages> {
//   List categoryItemlist = [];
//
//   Future getAllCategory() async {
//     var baseUrl = "https://gssskhokhar.com/api/classes/";
//
//     http.Response response = await http.get(Uri.parse(baseUrl));
//
//     if (response.statusCode == 200) {
//       var jsonData = json.decode(response.body);
//       setState(() {
//         categoryItemlist = jsonData;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getAllCategory();
//   }
//
//   var dropdownvalue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("DropDown List"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DropdownButton(
//               hint: Text('hooseNumber'),
//               items: categoryItemlist.map((item) {
//                 return DropdownMenuItem(
//                   value: item['ClassCode'].toString(),
//                   child: Text(item['ClassName'].toString()),
//                 );
//               }).toList(),
//               onChanged: (newVal) {
//                 setState(() {
//                   dropdownvalue = newVal;
//                 });
//               },
//               value: dropdownvalue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
