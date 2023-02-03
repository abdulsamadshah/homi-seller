import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/constants/fonts.dart';
import 'package:homlisellerapp/app/shared/utility.dart';
import 'package:homlisellerapp/app/shared/widgets/animation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../View_Model/Shopdetails_controller.dart';
import '../constants/colors.dart';
import '../constants/colors.dart';
import '../routes/RoutesName.dart';
import '../shared/color.dart';
import '../shared/validator.dart';
import 'home_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../service/dropdown.service.dart';


void main() {
  runApp(const ShopDetails());
}

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Shop Details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
 String? yesandno='Yes';
  ShopdetailsController controller =Get.put(ShopdetailsController());

  String? fssaivaliditydate;
  var pickImage = ImagePicker();
  File? companypanphoto,
      companygstphoto,
      companyfssaicertificate,
      companybrandlogo;
  String? birthDateInString;
  DateTime? birthDate;

  dynamic stateid;
  dynamic stateitemselected;

  dynamic Cityid;
  dynamic Cityitemselected;

  dynamic Districtid;
  dynamic Districtitemselected;
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getid();
  }

  Future<void> getid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('id') ?? '';
  }

  bool showspinner = false;

  bool companypanphotouploaded = false;
  bool companypanphotos = true;

  bool companygstphotouploaded = false;
  bool companygstphotos = true;

  bool companyfssaicertificatephotouploaded = false;
  bool companyfssaicertificatephotos = true;

  bool companybrandlogophotouploaded = false;
  bool companybrandlogophotos = true;

  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Container(
              // height: Get.height * 0.930,
              child: Form(
                key: controller.shopdetailsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Store set up",
                      style: TextStyle(
                          fontFamily: PoppinsSemibold,
                          fontSize: 18,
                          color: Appcolors.textcolor),
                    ),
                    Text(
                      "Enter your business details",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: PoppinsRegular,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Are you running business from home  ?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: PoppinsRegular,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 49,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffE9E4DA)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: RadioListTile(
                                title: Text(
                                  "Yes",
                                  style: TextStyle(fontFamily: PoppinsMedium),
                                ),
                                value: "Yes",
                                groupValue: yesandno,
                                onChanged: (value) {
                                  setState(() {
                                    yesandno = value.toString();
                                    print(yesandno);
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: RadioListTile(
                                title: Text(
                                  "No",
                                  style: TextStyle(fontFamily: PoppinsMedium),
                                ),
                                value: "No",
                                groupValue: yesandno,
                                onChanged: (value) {
                                  setState(() {
                                    yesandno = value.toString();
                                    print(yesandno);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 49,
                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateName,
                          controller: controller.companyname,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Zrow Solution",
                            labelText: "Company Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 49,
                        // child: TextField(
                        //   controller: controller.companypannumber,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "E.g. ALWPG5809L",
                        //     labelText: "Company PAN Number",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.CompanypanNumber,
                          controller: controller.companypannumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "E.g. ALWPG5809L",
                            labelText: "Company PAN Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 49,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              enabled: false,
                              decoration: InputDecoration(
                                // hintText: "Company Pan  Photo",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companypanphotouploaded,
                              child: Text(
                                "Company Pan Uploaded",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Appcolors.Toastcolor),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companypanphotos,
                              child: Text(
                                "Company Pan  Photo",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Colors.grey),
                              )),
                        ),

                        InkWell(
                          onTap: () {
                            int i=0;
                            i++;
                            print(i);
                            if(i==1){
                              selectComapanypandialog(context);
                              companypanphotouploaded =true;
                              companypanphotos=false;
                            }else{
                              selectComapanypandialog(context);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 205, top: 12),
                            child: Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xfff5f5f5),
                              ),
                              child: Center(
                                  child: Text(
                                    "Choose File",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 49,
                        // child: TextField(
                        //   controller: controller.companygstnumber,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "AAAAA0000A",
                        //     labelText: "Company GST Number",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateGstAddhars,
                          controller: controller.companygstnumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "AAAAA0000A",
                            labelText: "Company GST Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 49,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              enabled: false,
                              decoration: InputDecoration(
                                // hintText: "GST Photo",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companygstphotouploaded,
                              child: Text(
                                "GST Photo Uploaded",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Appcolors.Toastcolor),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companygstphotos,
                              child: Text(
                                "GST Photo",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Colors.grey),
                              )),
                        ),

                        InkWell(
                          onTap: () {
                            int i=0;
                            i++;
                            print(i);
                            if(i==1){
                              selectComapanygstdialog(context);
                              companygstphotouploaded =true;
                              companygstphotos=false;
                            }else{
                              selectComapanygstdialog(context);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 205, top: 12),
                            child: Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xfff5f5f5),
                              ),
                              child: Center(
                                  child: Text(
                                    "Choose File",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 49,
                        // child: TextField(
                        //   controller: controller.companyfssainumber,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "FSSAI Registration Number",
                        //     labelText: "FSSAI Registration Number",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          keyboardType: TextInputType.number,
                          validator:
                          Validator.validateFffsairegisterationnumber,
                          controller: controller.companyfssainumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "FSSAI Registration Number",
                            labelText: "FSSAI Registration Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 4),
                    //   child: Container(
                    //     // height: 49,
                    //     // child: TextField(
                    //     //   controller: controller.companyfssaidate,
                    //     //   textAlignVertical: TextAlignVertical.bottom,
                    //     //   enabled: true,
                    //     //   decoration: InputDecoration(
                    //     //     hintText: "FSSAI Validity Date",
                    //     //     labelText: "FSSAI Validity Date",
                    //     //     border: OutlineInputBorder(
                    //     //         borderRadius: BorderRadius.circular(15.0),
                    //     //         borderSide: BorderSide(color: Colors.grey)),
                    //     //   ),
                    //     // ),
                    //
                    //     child: TextFormField(
                    //       // validator: Validator.validatePancard,
                    //       validator: Validator.validateNumber,
                    //       controller: controller.companyfssaidate,
                    //       decoration: InputDecoration(
                    //         hintMaxLines: 10,
                    //         contentPadding: EdgeInsets.only(left: 10, top: 6),
                    //         hintText: "FSSAI Validity Date",
                    //         labelText: "FSSAI Validity Date",
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(15.0)),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    InkWell(
                      onTap: () async {
                        DateTime? datepicked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1930),
                            lastDate: DateTime(2027));

                        if (datepicked != null) {
                          setState(() {
                            fssaivaliditydate =
                            "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                            print(fssaivaliditydate);
                          });
                        } else if (datepicked == "null" && datepicked == null) {
                          setState(() {
                            fssaivaliditydate = "Select Date of Birth";
                          });
                        } else {
                          setState(() {
                            fssaivaliditydate = "Select Date of Birth";
                          });
                        }

                        //bottom datapicker select to date of birth
                        // DatePicker.showDatePicker(context,
                        //     showTitleActions: true,
                        //     minTime: DateTime(2014, 3, 5),
                        //     maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                        //       print('change $date');
                        //     }, onConfirm: (date) {
                        //       print('confirm $date');
                        //     }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              height: 49,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText:
                                  "${fssaivaliditydate.toString() == "null" ? "Select Fssai Validity Date" : fssaivaliditydate} ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide:
                                      BorderSide(color: Colors.grey)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 275, top: 15),
                            child: Icon(
                              Icons.calendar_month_sharp,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 49,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              enabled: false,
                              decoration: InputDecoration(
                                // hintText: "FSSAI Certificate",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companyfssaicertificatephotouploaded,
                              child: Text(
                                "FSSAI Certificate Uploaded",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Appcolors.Toastcolor),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companyfssaicertificatephotos,
                              child: Text(
                                "FSSAI Certificate",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Colors.grey),
                              )),
                        ),

                        InkWell(
                          onTap: () {
                            int i=0;
                            i++;
                            print(i);
                            if(i==1){
                              selectComapanyfssaicerficatedialog(context);
                              companyfssaicertificatephotouploaded =true;
                              companyfssaicertificatephotos=false;
                            }else{
                              selectComapanyfssaicerficatedialog(context);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 205, top: 12),
                            child: Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xfff5f5f5),
                              ),
                              child: Center(
                                  child: Text(
                                    "Choose File",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 49,
                        // child: TextField(
                        //   controller: controller.companywhatsappnumber,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Whatsapp Number",
                        //     labelText: "Whatsapp Number",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          keyboardType: TextInputType.number,
                          validator: Validator.validateNumber,
                          controller: controller.companywhatsappnumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Whatsapp Number",
                            labelText: "Whatsapp Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    //another thing

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateName,
                          controller: controller.companybrandname,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Zrow Solution",
                            labelText: "Brand Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 49,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              enabled: false,
                              decoration: InputDecoration(
                                // hintText: "Brand logo",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companybrandlogophotouploaded,
                              child: Text(
                                "Brand logo Uploaded",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Appcolors.Toastcolor),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: Visibility(
                              visible: companybrandlogophotos,
                              child: Text(
                                "Brand logo",
                                style: TextStyle(
                                    fontFamily: PoppinsRegular,
                                    color: Colors.grey),
                              )),
                        ),


                        InkWell(
                          onTap: () {
                            int i=0;
                            i++;
                            print(i);
                            if(i==1){
                              selectComapanybranddialog(context);
                              companybrandlogophotouploaded =true;
                              companybrandlogophotos=false;
                            }else{
                              selectComapanybranddialog(context);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 205, top: 12),
                            child: Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xfff5f5f5),
                              ),
                              child: Center(
                                  child: Text(
                                    "Choose File",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateName,
                          controller: controller.companyaddress,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Address",
                            labelText: "Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 49,
                        // child: TextField(
                        //   controller: controller.companyaddress2,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Address 2",
                        //     labelText: "Address 2",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateAddress,
                          controller: controller.companyaddress2,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Address 2",
                            labelText: "Address 2",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // height: 50,
                      child: DropdownSearch<dynamic>(
                        enabled: true,
                        // popupTitle: const Text(
                        //   "Select Job Category",
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500,
                        //       color: Colors.red),
                        // ),
                        popupBackgroundColor: Colors.white,
                        validator: (value) {
                          if (value == null) {
                            return "Please select a State";
                          } else {
                            return null;
                          }
                        },
                        dropdownSearchDecoration: const InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          isDense: true,
                          filled: true,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10.0,
                            top: 0.0,
                            bottom: 4.0,
                            right: 5.0,
                          ),
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        popupItemBuilder: (context, item, isSelected) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            // dense: true,
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (item['name'].toString()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Divider(color: Colors.grey),
                                ],
                              ),
                            ),
                          );
                        },
                        dropdownBuilder: (context, selectedItem) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: (selectedItem?['id'] == null)
                                ? Row(
                              children: const [
                                Text(
                                  "Select State",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'poppins',
                                    color: Color(0xff9D9EA3),
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                                : Text(
                              selectedItem['name'].toString(),
                              style: const TextStyle(
                                color: Color(0xff78746D),
                                letterSpacing: 1,
                              ),
                            ),
                          );
                        },
                        mode: Mode.MENU,
                        itemAsString: (dynamic u) {
                          if (u?.name != null) {
                            return u!.name.toString();
                          } else {
                            return "No State selected";
                          }
                        },
                        selectedItem: stateitemselected,
                        onFind: (String? filter) {
                          return Dropdownservice().getStatemain();
                        },
                        onChanged: (value) {
                          stateitemselected = value;
                          stateid = stateitemselected['id'];
                          print(stateid);
                          controller.saveStateId(stateid.toString());

                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // height: 50,
                      child: DropdownSearch<dynamic>(
                        enabled: true,
                        // popupTitle: const Text(
                        //   "Select Job Category",
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500,
                        //       color: Colors.red),
                        // ),
                        popupBackgroundColor: Colors.white,
                        validator: (value) {
                          if (value == null) {
                            return "Please select a City";
                          } else {
                            return null;
                          }
                        },
                        dropdownSearchDecoration: const InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          isDense: true,
                          filled: true,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10.0,
                            top: 0.0,
                            bottom: 4.0,
                            right: 5.0,
                          ),
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        popupItemBuilder: (context, item, isSelected) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            // dense: true,
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (item['name'].toString()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Divider(color: Colors.grey),
                                ],
                              ),
                            ),
                          );
                        },
                        dropdownBuilder: (context, selectedItem) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: (selectedItem?['id'] == null)
                                ? Row(
                              children: const [
                                Text(
                                  "Select City",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'poppins',
                                    color: Color(0xff9D9EA3),
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                                : Text(
                              selectedItem['name'].toString(),
                              style: const TextStyle(
                                color: Color(0xff78746D),
                                letterSpacing: 1,
                              ),
                            ),
                          );
                        },
                        mode: Mode.MENU,
                        itemAsString: (dynamic u) {
                          if (u?.name != null) {
                            return u!.name.toString();
                          } else {
                            return "No City selected";
                          }
                        },
                        selectedItem: Cityitemselected,
                        onFind: (String? filter) {
                          return Dropdownservice().getStatedata();
                        },
                        onChanged: (value) {
                          Cityitemselected = value;
                          Cityid = Cityitemselected['id'];
                          controller.saveCityId(Cityid.toString());
                          print("City Id:"+Cityid.toString());
                        },
                      ),
                    ),


                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      // height: 50,
                      child: DropdownSearch<dynamic>(
                        enabled: true,
                        // popupTitle: const Text(
                        //   "Select Job Category",
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500,
                        //       color: Colors.red),
                        // ),
                        popupBackgroundColor: Colors.white,
                        validator: (value) {
                          if (value == null) {
                            return "Please select a District";
                          } else {
                            return null;
                          }
                        },
                        dropdownSearchDecoration: const InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          isDense: true,
                          filled: true,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10.0,
                            top: 0.0,
                            bottom: 4.0,
                            right: 5.0,
                          ),
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        popupItemBuilder: (context, item, isSelected) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            // dense: true,
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (item['name'].toString()),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Divider(color: Colors.grey),
                                ],
                              ),
                            ),
                          );
                        },
                        dropdownBuilder: (context, selectedItem) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: (selectedItem?['id'] == null)
                                ? Row(
                              children: const [
                                Text(
                                  "Select District",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'poppins',
                                    color: Color(0xff9D9EA3),
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                                : Text(
                              selectedItem['name'].toString(),
                              style: const TextStyle(
                                color: Color(0xff78746D),
                                letterSpacing: 1,
                              ),
                            ),
                          );
                        },
                        mode: Mode.MENU,
                        itemAsString: (dynamic u) {
                          if (u?.name != null) {
                            return u!.name.toString();
                          } else {
                            return "No District selected";
                          }
                        },
                        selectedItem: Districtitemselected,
                        onFind: (String? filter) {
                          Map districtid={
                            'id':Districtid.toString(),
                          };
                          return Dropdownservice().getDistrictData();
                        },
                        onChanged: (value) {
                          Districtitemselected = value;
                          Districtid = Districtitemselected['id'];
                          print("District Id:"+Districtid.toString());
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validatePincode,
                          controller: controller.companypincode,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Pin code",
                            labelText: "Pin code",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Icon(
                            Icons.check_box_outline_blank_outlined,
                            color: FixedColors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){

                        if (controller.shopdetailsKey.currentState!.validate()) {
                            if(controller.companyname.text.toString()=="" && controller.companyname.text.toString()==null && controller.companyname.text.toString().isEmpty){
                              Utility().myfluttertoast("company_name Number is Empty");
                            }else if(controller.companypannumber.text.toString()=="" && controller.companypannumber.text.toString()==null && controller.companypannumber.text.toString().isEmpty){
                              Utility().myfluttertoast("company_pan_no Number is Empty");
                            }else if(controller.companygstnumber.text.toString()=="" && controller.companygstnumber.text.toString()==null && controller.companygstnumber.text.toString().isEmpty){
                              Utility().myfluttertoast("gst_number Number is Empty");
                            }else if(controller.companyfssainumber.text.toString()=="" && controller.companyfssainumber.text.toString()==null && controller.companyfssainumber.text.toString().isEmpty){
                              Utility().myfluttertoast("fssai_number Number is Empty");
                            }else if(fssaivaliditydate.toString()=="" && fssaivaliditydate.toString()==null && fssaivaliditydate.toString().isEmpty){
                              Utility().myfluttertoast("fssai_date Number is Empty");
                            }else if(controller.companywhatsappnumber.text.toString()=="" && controller.companywhatsappnumber.text.toString()==null && controller.companywhatsappnumber.text.toString().isEmpty){
                              Utility().myfluttertoast("whatsapp Number is Empty");
                            }else if(controller.companybrandname.text.toString()=="" && controller.companybrandname.text.toString()==null && controller.companybrandname.text.toString().isEmpty){
                              Utility().myfluttertoast("brand_name  is Empty");
                            }else if(controller.companyaddress.text.toString()=="" && controller.companyaddress.text.toString()==null && controller.companyaddress.text.toString().isEmpty){
                              Utility().myfluttertoast("bussiness_address_1  is Empty");
                            }else if(controller.companyaddress2.text.toString()=="" && controller.companyaddress2.text.toString()==null && controller.companyaddress2.text.toString().isEmpty){
                              Utility().myfluttertoast("bussiness_address_2  is Empty");
                            }else if(stateid.toString()=="" && stateid.toString()==null && stateid.toString().isEmpty){
                              Utility().myfluttertoast("Select The State");
                            }else if(Cityid.toString()=="" && Cityid.toString()==null && Cityid.toString().isEmpty){
                              Utility().myfluttertoast("Select The City");
                            }else if(Districtid.toString()=="" && Districtid.toString()==null && Districtid.toString().isEmpty){
                              Utility().myfluttertoast("Select The District");
                            }else if(controller.companypincode.text.toString()=="" && controller.companypincode.text.toString()==null && controller.companypincode.text.toString().isEmpty){
                              Utility().myfluttertoast("Pincode  is Empty");
                            }else{
                              uploadpersonaldetails();
                            }
                        }
                      },
                      child: Center(
                        child: Container(
                          height: 49,
                          decoration: BoxDecoration(
                            color: FixedColors.purple,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Register',
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
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadpersonaldetails() async {



    //user data to server
    SharedPreferences userpref = await SharedPreferences.getInstance();
    setState(() {
      id = userpref.getString('id') ?? '';
    });




    var uri = Uri.parse('http://homliadmin.globusachievers.com/api/seller-company');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['company_name'] = controller.companyname.text.toString();
    request.fields['company_pan_no'] =
        controller.companypannumber.text.toString();
    request.fields['gst_number'] = controller.companygstnumber.text.toString();
    request.fields['fssai_number'] =
        controller.companyfssainumber.text.toString();
    request.fields['fssai_date'] = fssaivaliditydate.toString();
    request.fields['whatsapp'] =
        controller.companywhatsappnumber.text.toString();
    request.fields['brand_name'] = controller.companybrandname.text.toString();
    request.fields['bussiness_address_1'] =
        controller.companyaddress.text.toString();
    request.fields['bussiness_address_2'] =
        controller.companyaddress2.text.toString();
    request.fields['state'] = stateid.toString();
    request.fields['city'] = Cityid.toString();
    request.fields['district'] = Districtid.toString();
    request.fields['pincode'] = controller.companypincode.text.toString();
    request.fields['id'] = id.toString();

    var company_pan_imagemultiport = await http.MultipartFile.fromPath(
        "company_pan_image", companypanphoto!.path);
    request.files.add(company_pan_imagemultiport);

    var gst_imagemultiport =
    await http.MultipartFile.fromPath("gst_image", companygstphoto!.path);
    request.files.add(gst_imagemultiport);

    var fssai_imagemultiport = await http.MultipartFile.fromPath(
        "fssai_image", companyfssaicertificate!.path);
    request.files.add(fssai_imagemultiport);


    var company_logomultiport = await http.MultipartFile.fromPath(
        "company_logo", companybrandlogo!.path);
    request.files.add(company_logomultiport);

    print("All parametres" + request.toString());
    setState(() {
      showspinner = true;
    });

    var response = await request.send().timeout(Duration(seconds: 10));

    var responseString = await response.stream.bytesToString();
    print(response.stream.toString());
    if (response.statusCode == 200) {
      final decodedMap = json.decode(responseString);
      if (decodedMap['status'] == "true") {
        print(decodedMap['data']);
        controller.saveusertoken(decodedMap['data']);

        print('Shop Detail Uploaded Successfully');
        // Utility().myfluttertoast(value['msg']);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
        Utility().myfluttertoast("Shop Detail Uploaded Successfully");
        setState(() {
          showspinner = false;
        });
      }else{
        setState(() {
          showspinner = false;
        });
      }


    } else {
      setState(() {
        showspinner = false;
      });
      print('failed');
      Utility().myfluttertoast("Some thing wrong data");
    }

    print("ids${id.toString()}:Comapany_Name:${controller.companyname.text.toString()} :company_pan_no:${controller.companypannumber.text.toString()}:gst_number:${controller.companygstnumber.text.toString()}:fssai_number:${controller.companyfssainumber.text.toString()}:fssai_date:${fssaivaliditydate.toString()}:whatsapp${controller.companywhatsappnumber.text.toString()} :brand_name:${controller.companybrandname.text.toString()}:bussiness_address_1:${controller.companyaddress.text.toString()}:bussiness_address_2:${controller.companyaddress2.text.toString()}:state:${stateid.toString()} :city${Cityid.toString()}:district${Districtid.toString()}:pin_code:${controller.companypincode.text.toString()}: id:${id.toString()}: company_pan_image:${companypanphoto!.path}:gst_image:${companyfssaicertificate!.path}: fssai_image:${companyfssaicertificate!.path} :company_logo:${companybrandlogo!.path}");

  }

  Future getcompanypanphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companypanphoto = File(pickfile.path);
        // Utility().myfluttertoast("Pan Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanypancamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companypanphoto = File(pickfile.path);
        // Utility().myfluttertoast("Pan  Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectComapanypandialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getcompanypancamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getcompanypanphoto();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getcompanygstphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companygstphoto = File(pickfile.path);
        // Utility().myfluttertoast("Gst Image Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanygstcamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companygstphoto = File(pickfile.path);
        // Utility().myfluttertoast("Gst Image  Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectComapanygstdialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getcompanygstcamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getcompanygstphoto();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getcompanyfssaicerficatephoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companyfssaicertificate = File(pickfile.path);
        // Utility().myfluttertoast("Fssai Certificate Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanyfssaicerficatecamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companyfssaicertificate = File(pickfile.path);
        // Utility().myfluttertoast("Fssai Certificate  Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectComapanyfssaicerficatedialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getcompanyfssaicerficatecamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getcompanyfssaicerficatephoto();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getcompanybrandphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companybrandlogo = File(pickfile.path);
        // Utility().myfluttertoast("Brand Logo Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanybrandcamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner = true;
        companybrandlogo = File(pickfile.path);
        // Utility().myfluttertoast("Brand Logo  Uploaded Successfully");
        showspinner = false;
      } else {
        showspinner = false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectComapanybranddialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getcompanybrandcamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getcompanybrandphoto();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void SignupSuccessdialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  CircleAvatar(
                    // child: Icon(Icons.right),
                  )
                ],
              ),
            ),
          );
        });
  }



}

