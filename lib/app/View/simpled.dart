// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
//
// import '../model/statelistmodel.dart';
//
// void main() {
//   runApp(const MyApp());
// }
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
//       home: const Simpledialog(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class Simpledialog  extends StatefulWidget {
//   const Simpledialog ({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePagesSState createState() => _MyHomePagesSState();
// }
//
// class _MyHomePagesSState extends State<Simpledialog > {
//   String? dropdownvalue;
//
//
//   Future<Statelist> getAllCategory () async {
//     final response = await http.get(Uri.parse('https://webhook.site/b7db08d7-aeef-48e7-b9e9-7715e655adf8'));
//     var data = jsonDecode(response.body.toString());
//     if(response.statusCode == 200){
//       return Statelist.fromJson(data);
//     }else {
//       return Statelist.fromJson(data);
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
//           children: [
//             FutureBuilder<Statelist>(
//               future: getAllCategory(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   // var data = snapshot.data!.data.toString();
//                   return ListView.builder(
//                       itemCount: snapshot.data!.data!.length,
//                       itemBuilder: (context, index){
//                         return DropdownButton(
//                           // Initial Value
//                           // value: dropdownvalue ?? data[0],
//                           value: snapshot.data!.data![index].name,
//
//                           // Down Arrow Icon
//                           icon: const Icon(Icons.keyboard_arrow_down),
//
//                           // Array list of items
//                           // items: snapshot.data.map((String items) {
//                           //   return DropdownMenuItem(
//                           //     value: items,
//                           //     child: Text(items),
//                           //   );
//                           // }).toList(),
//
//                             items: Statelist.map((item) {
//                               return new DropdownMenuItem(
//                                 child: new Text(item['name']),
//                                 value: item['id'].toString(),
//                               );
//                             })?.toList() ??,
//                           // After selecting the desired option,it will
//                           // change button value to selected value
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               dropdownvalue = newValue!;
//                             });
//                           },
//                         );
//
//                   });
//                 } else {
//                   return const CircularProgressIndicator();
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
