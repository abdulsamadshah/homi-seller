import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/View/seller_store_form.dart';
import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/widgets/choose_file_widget.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';

class SellerDetail extends StatefulWidget {
  const SellerDetail({Key? key}) : super(key: key);

  @override
  State<SellerDetail> createState() => _SellerDetailState();
}

class _SellerDetailState extends State<SellerDetail> {
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Text(
                'Personal Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                'Complete your profile',
                style: TextStyle(
                    fontSize: 20,
                    color: FixedColors.grey,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Gender',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(108, 93, 93, 0.8),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 145,
                width: 300,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => FixedColors.purple),
                          value: 0,
                          groupValue: 0,
                          onChanged: null,
                        ),
                        const Text('Female')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => FixedColors.purple),
                            value: 0,
                            groupValue: 0,
                            onChanged: null),
                        const Text('Male')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => FixedColors.purple),
                            value: 0,
                            groupValue: 0,
                            onChanged: null),
                        const Text('Other')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const TextFieldWidget(
                hintText: '13/09/1998', labelText: 'Date of Birth'),
            const SizedBox(
              height: 10,
            ),
            const TextFieldWidget(
                hintText: 'DZZPL531N', labelText: 'Personal Pan Number'),
                 const SizedBox(
              height: 10,
            ),
            const ChooseFileWidget(hinttext: 'Personal Pan Photo', subtitle: 'Choose File',),
            const SizedBox(
              height: 10,
            ),
            const TextFieldWidget(
                hintText: 'DZZPL531N', labelText: 'Personal Pan Number'),
                 const SizedBox(
              height: 10,
            ),
           
            const ChooseFileWidget(hinttext: 'Personal Aadhaar Photo', subtitle: 'Choose File',),
            const SizedBox(
              height: 10,
            ),
            const TextFieldWidget(
                hintText: 'DZZPL531N', labelText: 'Personal Pan Number'),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SellerStoreFormeOne()));
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
          ],
        ),
      ),
    );
  }
}
