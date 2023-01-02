
import 'package:flutter/material.dart';

import 'package:homlisellerapp/app/shared/widgets/dropdown_widget.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';

import '../../../../shared/color.dart';
import '../../../../shared/widgets/choose_file_widget.dart';
import '../../../../shared/widgets/radio_container_widget.dart';

class KhazanaFoodOne extends StatelessWidget {
  const KhazanaFoodOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Select Product',
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
              height: 10,
            ),
            const TextFieldWidget(hintText: '', labelText: 'Product Name'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Text(
                    'Please fill product details',
                    style: TextStyle(
                        color: FixedColors.purple,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  ' Category ',
                  style: TextStyle(
                      color: FixedColors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
                Text(
                  '  Sub Category',
                  style: TextStyle(
                      color: FixedColors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            
            const ChooseFileWidget(hinttext: 'Product Image', subtitle: 'Choose File',),
            const SizedBox(
              height: 10,
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
              height: 15,
            ),
            const TextFieldWidget(hintText: '', labelText: 'Price'),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Type',
                style: TextStyle(
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const RadioContainerWidget(titleOne: 'Veg', titleTwo: 'Non-Veg'),
            const SizedBox(
              height: 10,
            ),
            const DropdownWidget(title: 'Serves')
          ],
        ),
      ),
    );
  }
}