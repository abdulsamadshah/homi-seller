import 'package:flutter/material.dart';

import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/widgets/choose_file_widget.dart';

class KhazanaFormTwoView extends StatelessWidget {
  const KhazanaFormTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Add Product',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Please fill product details',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            const ChooseFileWidget(hinttext: 'Product Image', subtitle: 'Choose File',),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 168,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 5,
                  shadowColor: FixedColors.grey,
                  child: TextField(
                    decoration: InputDecoration(
                        constraints: const BoxConstraints(maxWidth: 340),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide.none),
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: FixedColors.purple,
                          fontSize: 18,
                        ),
                        hintText: 'Product Description',
                        hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(108, 93, 93, 0.8),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const NumberOtpView()));
              },
              child: Center(
                child: Container(
                  width: 290,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FixedColors.purple,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}