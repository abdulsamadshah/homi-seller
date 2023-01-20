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

class ShopDetails extends StatefulWidget {
  const ShopDetails({Key? key}) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailssState();
}

class _ShopDetailssState extends State<ShopDetails> {
  ShopdetailsController controller = ShopdetailsController();

  String? gender;
  var pickImage = ImagePicker();
  File? companypanphoto,
      companygstphoto,
      companyfssaicertificate,
      companybrandlogo;
  String? birthDateInString;
  DateTime? birthDate;

  String Statevalue = 'Select State';
  var State = [
    'Select State',
    'Andhra Pradesh',
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
  ];
  var Statename;

  String Cityvalue = 'Select City';
  var City = [
    'Select City',
    'Mumbai',
    "Delhi",
    "Bangalore",
    "Hyderabad",
  ];
  var Cityname;

  String Districtvalue = 'Select District';
  var District = [
    'Select District',
    'Thane',
    "Palghar",
    "Raigad",
    "Ratnagiri",
  ];
  var Districtname;

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

  @override
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
                key:controller.shopdetailsKey,
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
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                    print(gender);
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
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                    print(gender);
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
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                          validator: Validator.validateNumber,
                            controller: controller.companypannumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "E.g. ALWPG5809L",
                                labelText: "Company PAN Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                                hintText: "Company Pan  Photo",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectComapanypandialog(context);
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
                          validator: Validator.validateNumber,
                            controller: controller.companygstnumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "AAAAA0000A",
                                labelText: "Company GST Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                                hintText: "GST Photo",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectComapanygstdialog(context);
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
                          validator: Validator.validateFffsairegisterationnumber,
                            controller: controller.companyfssainumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "FSSAI Registration Number",
                                labelText: "FSSAI Registration Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                        //   controller: controller.companyfssaidate,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "FSSAI Validity Date",
                        //     labelText: "FSSAI Validity Date",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateNumber,
                            controller: controller.companyfssaidate,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "FSSAI Validity Date",
                                labelText: "FSSAI Validity Date",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                                hintText: "FSSAI Certificate",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectComapanyfssaicerficatedialog(context);
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
                          validator: Validator.validateNumber,
                            controller: controller.companywhatsappnumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "Whatsapp Number",
                                labelText: "Whatsapp Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                        height: 49,
                        // child: TextField(
                        //   controller: controller.companybrandname,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Zrow Solution",
                        //     labelText: "Brand Name",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateNumber,
                            controller: controller.companybrandname,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "Zrow Solution",
                                labelText: "Brand Name",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                                hintText: "Brand logo",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectComapanybranddialog(context);
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
                        //   controller: controller.companyaddress,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Address",
                        //     labelText: "Address",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),

                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validateNumber,
                            controller: controller.companyaddress,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "Address",
                                labelText: "Address",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                          validator: Validator.validateNumber,
                            controller: controller.companyaddress2,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "Address 2",
                                labelText: "Address 2",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                                // labelText: Statename,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 8),
                          child: Container(
                            child: SingleChildScrollView(
                              child: DropdownButton(
                                // Initial Value
                                value: Statevalue,
                                underline: SizedBox.shrink(),

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: State.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 130),
                                      child: Text(
                                        Statename = items,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    //var dropdownvalue any object set now
                                    Statevalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
                                // labelText: Statename,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 8),
                          child: Container(
                            child: SingleChildScrollView(
                              child: DropdownButton(
                                // Initial Value
                                value: Cityvalue,
                                underline: SizedBox.shrink(),

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: City.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 185),
                                      child: Text(
                                        Cityname = items,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    //var dropdownvalue any object set now
                                    Cityvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
                                // labelText: Statename,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 8),
                          child: Container(
                            child: SingleChildScrollView(
                              child: DropdownButton(
                                // Initial Value
                                value: Districtvalue,
                                underline: SizedBox.shrink(),

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: District.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 165),
                                      child: Text(
                                        Districtname = items,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    //var dropdownvalue any object set now
                                    Districtvalue = newValue!;
                                  });
                                },
                              ),
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
                        //   controller: controller.companypincode,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   enabled: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Pin code",
                        //     labelText: "Pin code",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //         borderSide: BorderSide(color: Colors.grey)),
                        //   ),
                        // ),


                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validatePincode,
                            controller: controller.companypincode,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                hintText: "Pin code",
                                labelText: "Pin code",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
                      onTap: () {
                        // Map shopdetailsparam = {
                        //   'company_name': controller.companyname.text.toString(),
                        //   'company_pan_no': controller.companypannumber,
                        //   'company_pan_image': companypanphoto.toString(),
                        //   'gst_number': controller.companygstnumber.text.toString(),
                        //   'gst_image': companygstphoto.toString(),
                        //   'fssai_number': controller.companyfssainumber.text.toString(),
                        //   'fssai_image': companyfssaicertificate.toString(),
                        //   'fssai_date': controller.companyfssaidate.text.toString(),
                        //   'whatsapp': controller.companywhatsappnumber.text.toString(),
                        //   'brand_name': controller.companybrandname.text.toString(),
                        //   'company_logo': companybrandlogo.toString(),
                        //   'bussiness_address_1': controller.companyaddress.text.toString(),
                        //   'bussiness_address_2': controller.companyaddress2.text.toString(),
                        //   'state': Statename.toString(),
                        //   'city': Cityname.toString(),
                        //   'district': Districtname.toString(),
                        //   'pin_code': controller.companypincode.text.toString(),
                        //   'id': id.toString(),
                        // };
                        // controller.sellerShopdetail(context, shopdetailsparam);
                        if(controller.shopdetailsKey.currentState!.validate()){
                          try{
                            uploadpersonaldetails();
                          }catch(e){
                            print(e.toString());
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
    setState(() {
      showspinner=true;
    });
    //user data to server
    SharedPreferences userpref = await SharedPreferences.getInstance();
    setState(() {
      id = userpref.getString('id') ?? '';
    });

    print("ids${id.toString()}");

    var uri =
        Uri.parse('http://homliadmin.globusachievers.com/api/seller-company');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['company_name'] = controller.companyname.text.toString();
    request.fields['company_pan_no'] =
        controller.companypannumber.text.toString();
    request.fields['gst_number'] = controller.companygstnumber.text.toString();
    request.fields['fssai_number'] =
        controller.companyfssainumber.text.toString();
    request.fields['fssai_date'] = controller.companyfssaidate.text.toString();
    request.fields['whatsapp'] =
        controller.companywhatsappnumber.text.toString();
    request.fields['brand_name'] = controller.companybrandname.text.toString();
    request.fields['bussiness_address_1'] =
        controller.companyaddress.text.toString();
    request.fields['bussiness_address_2'] =
        controller.companyaddress2.text.toString();
    request.fields['state'] = Statename.toString();
    request.fields['city'] = Cityname.toString();
    request.fields['district'] = Districtname.toString();
    request.fields['pin_code'] = controller.companypincode.text.toString();
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

    var response = await request.send();

    print(response.stream.toString());
    if (response.statusCode == 200) {
        setState(() {
          showspinner=false;
        });
      print('Shop Detail Uploaded Successfully');
      // Utility().myfluttertoast(value['msg']);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
      Utility().myfluttertoast("Shop Detail Uploaded Successfully");
    } else {
      setState(() {
        showspinner=false;
      });
      print('failed');
      Utility().myfluttertoast("Some thing wrong data");
    }
  }

  Future getcompanypanphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        showspinner=true;
        companypanphoto = File(pickfile.path);
        Utility().myfluttertoast("Pan Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanypancamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner=true;
        companypanphoto = File(pickfile.path);
        Utility().myfluttertoast("Pan  Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
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
        showspinner=true;
        companygstphoto = File(pickfile.path);
        Utility().myfluttertoast("Gst Image Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanygstcamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner=true;
        companygstphoto = File(pickfile.path);
        Utility().myfluttertoast("Gst Image  Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
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
        showspinner=true;
        companyfssaicertificate = File(pickfile.path);
        Utility().myfluttertoast("Fssai Certificate Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanyfssaicerficatecamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner=true;
        companyfssaicertificate = File(pickfile.path);
        Utility().myfluttertoast("Fssai Certificate  Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
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
        showspinner=true;
        companybrandlogo = File(pickfile.path);
        Utility().myfluttertoast("Brand Logo Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getcompanybrandcamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner=true;
        companybrandlogo = File(pickfile.path);
        Utility().myfluttertoast("Brand Logo  Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
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

// Future<void> uploadpersonaldetails() async {
//
//
//
//   SharedPreferences userpref =
//   await SharedPreferences.getInstance();
//   setState(() {
//     id = userpref.getString('id') ?? '';
//   });
//
//
//
//   var uri = Uri.parse('http://homliadmin.globusachievers.com/api/seller-personal');
//
//   var request = new http.MultipartRequest('POST', uri);
//
//
//   request.fields['company_name'] = controller.companyname.text.toString();
//   request.fields['company_pan_no'] = controller.companypannumber.toString();
//   request.fields['gst_number'] = controller.companygstnumber.text.toString();
//   request.fields['fssai_number'] = controller.companyfssainumber.text.toString();
//   request.fields['fssai_date'] = controller.companyfssaidate.text.toString();
//   request.fields['whatsapp'] = controller.companywhatsappnumber.text.toString();
//   request.fields['brand_name'] = controller.companybrandname.text.toString();
//   request.fields['bussiness_address_1'] = controller.companyaddress.text.toString();
//   request.fields['bussiness_address_2'] =controller.companyaddress2.text.toString();
//   request.fields['state'] =Statename.toString();
//   request.fields['city'] =Cityname.toString();
//   request.fields['district'] =Districtname.toString();
//   request.fields['pin_code'] =controller.companypincode.text.toString();
//   request.fields['id'] =id.toString();
//
//   Map shopdetailsparam = {
//     'company_name': controller.companyname.text.toString(),
//     'company_pan_no': controller.companypannumber,
//     'company_pan_image': companypanphoto.toString(),
//     'gst_number': controller.companygstnumber.text.toString(),
//     'gst_image': companygstphoto.toString(),
//     'fssai_number': controller.companyfssainumber.text.toString(),
//     'fssai_image': companyfssaicertificate.toString(),
//     'fssai_date': controller.companyfssaidate.text.toString(),
//     'whatsapp': controller.companywhatsappnumber.text.toString(),
//     'brand_name': controller.companybrandname.text.toString(),
//     'company_logo': companybrandlogo.toString(),
//     'bussiness_address_1': controller.companyaddress.text.toString(),
//     'bussiness_address_2': controller.companyaddress2.text.toString(),
//     'state': Statename.toString(),
//     'city': Cityname.toString(),
//     'district': Districtname.toString(),
//     'pin_code': controller.companypincode.text.toString(),
//     'id': id.toString(),
//   };
//
//   var company_logostream = new http.ByteStream(companybrandlogo!.openRead());
//   company_logostream.cast();
//   var company_logostreamlenghth = await companybrandlogo!.length();
//
//   var gst_imagestreamport = new http.MultipartFile('company_logo', company_logostream, company_logostreamlenghth);
//   request.files.add(gst_imagestreamport);
//
//   var fssai_imagestream = new http.ByteStream(companyfssaicertificate!.openRead());
//   fssai_imagestream.cast();
//   var fssai_imagestreamlength = await companyfssaicertificate!.length();
//
//   var gst_imagestreamport = new http.MultipartFile('fssai_image', fssai_imagestream, fssai_imagestreamlength);
//   request.files.add(gst_imagestreamport);
//
//
//   var gst_imagestream = new http.ByteStream(companygstphoto!.openRead());
//   gst_imagestream.cast();
//   var gst_imagestreamlenght = await companygstphoto!.length();
//
//   var gst_imagestreamport = new http.MultipartFile('gst_image', gst_imagestream, gst_imagestreamlenght);
//   request.files.add(gst_imagestreamport);
//
//
//   var company_pan_imagestream = new http.ByteStream(companypanphoto!.openRead());
//   company_pan_imagestream.cast();
//   var company_pan_imagestreamlenghth = await companypanphoto!.length();
//
//   var pancardmultiport = new http.MultipartFile('company_pan_image', company_pan_imagestream, company_pan_imagestreamlenghth);
//   request.files.add(pancardmultiport);
//
//
//
//
//
//
//
//   print("All parametres"+request.toString());
//
//   var response = await request.send();
//
//   print(response.stream.toString());
//   if (response.statusCode == 200) {
//     print('image uploaded');
//     Utility().myfluttertoast("Personal Detail Uploaded Successfully");
//   } else {
//     print('failed');
//     Utility().myfluttertoast("Some thing wrong data");
//   }
// }

}
