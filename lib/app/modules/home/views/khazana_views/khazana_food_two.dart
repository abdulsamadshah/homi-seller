import 'package:flutter/material.dart';

import 'package:homlisellerapp/app/shared/color.dart';

import '../../../../shared/widgets/dropdown_widget.dart';
import '../../../../shared/widgets/radio_container_widget.dart';
import '../../../../shared/widgets/textfield_widget.dart';

class KhazanaFoodTwo extends StatelessWidget {
  const KhazanaFoodTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Contains Egg',
                style: TextStyle(
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const RadioContainerWidget(titleOne: 'Yes', titleTwo: 'No'),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Jain',
                style: TextStyle(
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const RadioContainerWidget(titleOne: 'Yes', titleTwo: 'No'),
            const SizedBox(
              height: 5,
            ),
            const DropdownWidget(title: 'Spice Level'),
            const SizedBox(
              height: 5,
            ),
            const TextFieldWidget(hintText: '', labelText: 'Weight in GM/ML'),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Vegan',
                style: TextStyle(
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const RadioContainerWidget(titleOne: 'Yes', titleTwo: 'No'),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Contains Nuts',
                style: TextStyle(
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const RadioContainerWidget(titleOne: 'Yes', titleTwo: 'No'),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Sugar Free',
                style: TextStyle(
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const RadioContainerWidget(titleOne: 'Yes', titleTwo: 'No'),
            const SizedBox(
              height: 5,
            ),
            const DropdownWidget(title: 'Types of Oil used')
          ],
        ),
      ),
    );
  }
}
