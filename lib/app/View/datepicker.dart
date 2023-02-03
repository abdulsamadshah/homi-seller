// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
// import 'package:dio/dio.dart';
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
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
//   _MyHomePagesState createState() => _MyHomePagesState();
// }
//
// class _MyHomePagesState extends State<MyHomePages> {
//   String? dropdownvalue;
//
//   Future<List<String>> getAllCategory() async {
//     var baseUrl = "https://gssskhokhar.com/api/classes/";
//
//     http.Response response = await http.get(Uri.parse(baseUrl));
//
//     if (response.statusCode == 200) {
//       List<String> items = [];
//       var jsonData = json.decode(response.body) as List;
//
//       for (var element in jsonData) {
//         items.add(element["ClassName"]);
//       }
//       return items;
//     } else {
//       throw response.statusCode;
//     }
//   }
//
//   Future<void> gotodashboard() async {
//     try {
//       FormData data = FormData.fromMap({
//         "name": usernamecontroller.text,
//         "mobileno": phonecontroller.text,
//         "email": emailcontroller.text,
//         "password": passwordcontroller.text,
//         "con_password": confirmpasswordcontroller.text,
//         "category": labourId,
//         "aadhar_no": aadharnumbercontroller.text,
//         "pan_no": pannumbercontroller.text,
//         "bank_name": banknamecontroller.text,
//         "account_no": accountnumbercontroller.text,
//         "agent_code": agentcodecontroller.text,
//         "ifsc": ifscdodecontroller.text,
//         "aadhar_front": await MultipartFile.fromFile(aadharFront!,
//             filename: aadharFront,
//             contentType: MediaType(
//               'image',
//               'jpeg',
//             )),
//         "aadhar_back": await MultipartFile.fromFile(aadharBack!,
//             filename: aadharBack,
//             contentType: MediaType(
//               'image',
//               'jpeg',
//             )),
//         "pan_image": await MultipartFile.fromFile(aadharBack!,
//             filename: aadharBack,
//             contentType: MediaType(
//               'image',
//               'jpeg',
//             )),
//       });
//
//
//     } catch (e) {
//
//     }
//   }
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
//         children: [
//           ElevatedButton(onPressed: (){
//
//           }, child: Text("samda")),
//         ],
//         ),
//       ),
//     );
//   }
//   Future<void> gotodashboard() async {
//     if (_registerKey.currentState!.validate()) {
//       try {
//         FormData data = FormData.fromMap({
//           "name": usernamecontroller.text,
//           "mobileno": phonecontroller.text,
//           "email": emailcontroller.text,
//           "password": passwordcontroller.text,
//           "con_password": confirmpasswordcontroller.text,
//           "category": labourId,
//           "aadhar_no": aadharnumbercontroller.text,
//           "pan_no": pannumbercontroller.text,
//           "bank_name": banknamecontroller.text,
//           "account_no": accountnumbercontroller.text,
//           "agent_code": agentcodecontroller.text,
//           "ifsc": ifscdodecontroller.text,
//           "aadhar_front": await MultipartFile.fromFile(aadharFront!,
//               filename: aadharFront,
//               contentType: MediaType(
//                 'image',
//                 'jpeg',
//               )),
//           "aadhar_back": await MultipartFile.fromFile(aadharBack!,
//               filename: aadharBack,
//               contentType: MediaType(
//                 'image',
//                 'jpeg',
//               )),
//           "pan_image": await MultipartFile.fromFile(aadharBack!,
//               filename: aadharBack,
//               contentType: MediaType(
//                 'image',
//                 'jpeg',
//               )),
//         });
//
//         await UserService().register(data).then((loginRes) {
//           if (loginRes == 201) {
//             Navigator.pushNamed(context, "/login");
//           }
//         });
//       } catch (e) {
//         Fluttertoast.showToast(msg: 'Something went wrong');
//       }
//     }
//   }
// }
//
