// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:homlisellerapp/app/modules/registration/views/seller_store_form.dart';
// import 'package:homlisellerapp/app/shared/color.dart';

// class EmailOtpView extends StatelessWidget {
//   const EmailOtpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 150),
//               child: Text(
//                 'Enter Confirmation code',
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w900,
//                     fontSize: 18,
//                     color: Color.fromRGBO(45, 39, 39, 1)),
//               ),
//             ),
//             Text(
//               '4- digit code was send to',
//               style: TextStyle(fontSize: 14, color: FixedColors.grey),
//             ),
//             Text(
//               'N**********@gmail.com',
//               style: TextStyle(fontSize: 14, color: FixedColors.grey),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             OtpTextField(
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//               borderWidth: 1,
//               keyboardType: TextInputType.number,
//               cursorColor: FixedColors.black,
//               numberOfFields: 4,
//               borderColor: FixedColors.purple,
//               showFieldAsBox: true,
//               focusedBorderColor: FixedColors.purple,
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(
//               '00:30',
//               style: TextStyle(color: FixedColors.grey),
//             ),
//             const SizedBox(
//               height: 100,
//             ),
//             InkWell(
//               onTap: () {},
//               child: Text(
//                 'Resend code',
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 16,
//                     color: FixedColors.purple,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const SellerStoreFormeOne()));
//               },
//               child: Container(
//                 width: 290,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: FixedColors.purple,
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Continue',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontFamily: 'Poppins-Regular',
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
