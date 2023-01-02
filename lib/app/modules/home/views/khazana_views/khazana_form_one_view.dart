import 'package:flutter/material.dart';


import '../../../../shared/widgets/dropdown_widget.dart';
import '../../../../shared/widgets/textfield_widget.dart';

class KhazanaFormOneView extends StatelessWidget {
  const KhazanaFormOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 70,
            ),
            Padding(
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
            Padding(
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
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(hintText: '', labelText: 'Product Name'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Category'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Sub Category'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Sub sub Category'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Cuisine'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Seasons'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Festival'),
            SizedBox(
              height: 10,
            ),
            DropdownWidget(title: 'Main Ingredients'),
          ],
        ),
      ),
    );
  }
}