import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/widgets/choose_file_widget.dart';
import 'package:homlisellerapp/app/shared/widgets/radio_container_widget.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';

import '../shared/color.dart';
import '../shared/dialog.dart';
import '../shared/widgets/dropdown_widget.dart';
import 'home_view.dart';

class SellerStoreFormeOne extends StatelessWidget {
  const SellerStoreFormeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              'Store set up',
              style: TextStyle(
                  color: Color.fromRGBO(45, 39, 39, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              'Enter your business details',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(108, 93, 93, 0.8),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Are you running business fron home ?',
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(108, 93, 93, 0.8),
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.w500),
            ),
          ),
          const RadioContainerWidget(
            titleOne: 'Yes',
            titleTwo: 'No',
          ),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(
              hintText: 'Zrow Solutions', labelText: 'Company Name'),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(
              hintText: 'DZZPK345H', labelText: 'Company Pan Number'),
               const SizedBox(
              height: 10,
            ),
       
           const ChooseFileWidget(hinttext: 'Company Pan Photo', subtitle: 'Choose File',),

          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(hintText: '', labelText: 'Company GST Number'),
          const SizedBox(
            height: 10,
          ),
           const ChooseFileWidget(hinttext: 'Company GST Photo', subtitle: 'Choose File',),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(
              hintText: '', labelText: 'FSSAI Registration Number'),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(hintText: '', labelText: 'FSSAI Validity Date'),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(hintText: '', labelText: 'FSSAI Certificate'),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(
              hintText: '9921987777', labelText: 'Whatsapp Number'),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              'Store set up',
              style: TextStyle(
                  color: Color.fromRGBO(45, 39, 39, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              'Enter your business details',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(108, 93, 93, 0.8),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(
              hintText: 'Zrow Solutions', labelText: 'Brand Name'),
          const SizedBox(
            height: 10,
          ),
        
          const ChooseFileWidget(hinttext: 'Brand Logo', subtitle: 'Choose File',),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(hintText: '', labelText: 'Address'),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(hintText: '', labelText: 'Address 2'),
          const SizedBox(
            height: 10,
          ),
          const DropdownWidget(
            title: 'State',
          ),
          const SizedBox(
            height: 10,
          ),
          const DropdownWidget(
            title: 'City',
          ),
          const SizedBox(
            height: 10,
          ),
          const DropdownWidget(
            title: 'District',
          ),
          const SizedBox(
            height: 10,
          ),
          const TextFieldWidget(hintText: '402 102', labelText: 'Pin code'),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'I have read and agree with the',
                    style: TextStyle(
                        fontSize: 12,
                        color: FixedColors.grey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      ' Terms & conditions,',
                      style: TextStyle(
                          fontSize: 12,
                          color: FixedColors.purple,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: 12,
                          color: FixedColors.purple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    ' & ',
                    style: TextStyle(
                        fontSize: 12,
                        color: FixedColors.grey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'End User License Agreement ',
                      style: TextStyle(
                          fontSize: 12,
                          color: FixedColors.purple,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeView()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
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
        ]),
      ),
    );
  }
}
