import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/constants/fonts.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';
import 'package:homlisellerapp/app/shared/utility.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../View_Model/personaldetails_controller.dart';
import '../constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  PersonalDetailscontroller controller = PersonalDetailscontroller();

  static const String _title = 'Radio Button Example';
  String? gender;
  var pickImage = ImagePicker();
  File? addharcardfrontback;
  File? addharcardfronimg;
  File? pancimage;

  String? birthDateInString;
  DateTime? birthDate;
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

  // void selectlogodialog(context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           content: Container(
  //             height: 120,
  //             child: Column(
  //               children: [
  //                 InkWell(
  //                   onTap: () {
  //                     getImageCamera();
  //                     Navigator.pop(context);
  //                   },
  //                   child: ListTile(
  //                     leading: Icon(Icons.camera),
  //                     title: Text("Camera"),
  //                   ),
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     getImageGallery();
  //                     Navigator.pop(context);
  //                   },
  //                   child: ListTile(
  //                     leading: Icon(Icons.browse_gallery),
  //                     title: Text("Gallery"),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Container(
            height: Get.height * 0.930,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Details",
                  style: TextStyle(
                      fontFamily: PoppinsSemibold,
                      fontSize: 20,
                      color: Appcolors.textcolor),
                ),
                Text(
                  "Complete your profile",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: PoppinsRegular,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontFamily: PoppinsMedium),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffE9E4DA)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: RadioListTile(
                          title: Text("Female"),
                          value: "Female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                              print(gender);
                            });
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RadioListTile(
                            title: Text("Male"),
                            value: "Male",
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
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: RadioListTile(
                              title: Text("Other"),
                              value: "Other",
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
                      child: InkWell(
                        onTap: () async {
                          DateTime? datepicked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2024));

                          if (datepicked != null) {
                            setState(() {
                              print(
                                  "my date: ${datepicked.day},${datepicked.month},${datepicked.year}");
                            });
                          }
                        },
                        child: Container(
                          height: 49,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: "Date Of Birth",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    height: 49,
                    child: TextField(
                      controller: controller.pancardnumber,
                      textAlignVertical: TextAlignVertical.bottom,
                      enabled: true,
                      decoration: InputDecoration(
                        hintText: "Personal Pan Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    getPancardimg();
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
                              hintText: "Personal Pan Photo",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    height: 49,
                    child: TextField(
                      controller: controller.addharcardnumber,
                      textAlignVertical: TextAlignVertical.bottom,
                      enabled: true,
                      decoration: InputDecoration(
                        hintText: "Personal Aadhaar Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    getaddharpfronthoto();
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
                              hintText: "Personal Aadhaar Photo",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    getaddharbackphoto();
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
                              hintText: "Back Aadhaar Photo",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Map personaldata = {
                      'gender': gender,
                      'dob': "14/07/2021",
                      'pan_no': controller.pancardnumber.text.toString(),
                      'pan_image': pancimage.toString(),
                      'aadhar_no': controller.addharcardnumber.text.toString(),
                      'aadhar_front_image': addharcardfronimg.toString(),
                      'aadhar_back_image': addharcardfrontback.toString(),
                      'id': id.toString(),
                    };
                    print(personaldata);
                    controller.Personaldata(context, personaldata);
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Appcolors.ButtonColor,
                    ),
                    child: Center(
                        child: Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: PoppinsMedium,
                          fontSize: 15,
                          color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getPancardimg() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        pancimage = File(pickfile.path);
        Utility().myfluttertoast("Image Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getaddharpfronthoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        addharcardfronimg = File(pickfile.path);
        Utility().myfluttertoast("Image Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getaddharbackphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        addharcardfrontback = File(pickfile.path);
        Utility().myfluttertoast("Image Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

// Future getImageCamera() async {
//   final pickfile = await pickImage.pickImage(source: ImageSource.camera);
//   setState(() {
//     if (pickfile != null) {
//       image = File(pickfile.path);
//     } else {
//       Utility().myfluttertoast("No Image Selected");
//     }
//   });
// }
}
