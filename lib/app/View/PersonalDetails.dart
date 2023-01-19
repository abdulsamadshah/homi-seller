import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/constants/fonts.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';
import 'package:homlisellerapp/app/shared/utility.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import '../View_Model/personaldetails_controller.dart';
import '../constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../shared/validator.dart';
import 'ShopDetails.dart';
import 'datepicker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'home_view.dart';

void main() {
  runApp(const PersonalDetails());
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Personal Details'),
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
  PersonalDetailscontroller controller = PersonalDetailscontroller();

  static const String _title = 'Radio Button Example';
  String? gender;
  String? dateofbirth;
  String? id;
  var pickImage = ImagePicker();
  File? addharcardfrontback;
  File? addharcardfronimg;
  File? pancimage;

  String? birthDateInString;
  DateTime? birthDate;
  bool showspinner = false;

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Container(
              // height: Get.height * 0.1130,
              child: Form(
                key: controller.personaldetailsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        print("cliked");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePages()));
                      },
                      child: Text(
                        "Personal Details",
                        style: TextStyle(
                            fontFamily: PoppinsSemibold,
                            fontSize: 20,
                            color: Appcolors.textcolor),
                      ),
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
                            height: 55,
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
                              height: 45,
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
                    InkWell(
                      onTap: () async {
                        DateTime? datepicked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1920),
                            lastDate: DateTime(2025));

                        if (datepicked != null) {
                          setState(() {
                            dateofbirth =
                                "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                            print(dateofbirth);
                          });
                        } else if (datepicked == "null" && datepicked == null) {
                          setState(() {
                            dateofbirth = "Select Date of Birth";
                          });
                        } else {
                          setState(() {
                            dateofbirth = "Select Date of Birth";
                          });
                        }
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
                                  hintText: "${dateofbirth.toString()}",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(color: Colors.grey)),
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
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 4),
                    //   child: Container(
                    //     height: 49,
                    //     child: TextFormField(
                    //       controller: controller.pancardnumber,
                    //       textAlignVertical: TextAlignVertical.bottom,
                    //       enabled: true,
                    //       decoration: InputDecoration(
                    //         hintText: "Personal Pan Number",
                    //         labelText: "Personal Pan Number",
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(15.0),
                    //             borderSide: BorderSide(color: Colors.grey)),
                    //       ),
                    //     ),
                    //   ),
                    // ),


                    Padding(
                        padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 40,
                        child: TextFormField(
                          // validator: Validator.validatePancard,
                          validator: Validator.validatepandCard,
                          controller: controller.pancardnumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                                    hintText: "Personal Pan Number",
                                    labelText: "Personal Pan Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),

                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
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
                          InkWell(
                            onTap: () {
                              selectpancarddialog(context);
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 4),
                    //   child: Container(
                    //     height: 49,
                    //     child: TextField(
                    //       controller: controller.addharcardnumber,
                    //       textAlignVertical: TextAlignVertical.bottom,
                    //       enabled: true,
                    //       decoration: InputDecoration(
                    //         hintText: "Personal Aadhaar Number",
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(15.0),
                    //             borderSide: BorderSide(color: Colors.grey)),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        // height: 40,
                        child: TextFormField(
                          // validator: Validator.validateAadharcard,
                          validator: Validator.validateAadhar,
                          controller: controller.addharcardnumber,
                          decoration: InputDecoration(
                            hintMaxLines: 10,
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: "Personal Aadhaar Number",
                            labelText: "Personal Aadhaar Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),

                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        selectadharrfronimagedialog(context);
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
                        selectadharrbackimagedialog(context);
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
                      onTap: ()async {

                        if(controller.personaldetailsKey.currentState!.validate()){

                          try{
                            uploadpersonaldetails();
                          }catch(e){
                            print(e.toString());
                          }
                        }else{
                          // Utility().myfluttertoast("Enter the Valid Data");
                        }



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
    SharedPreferences userpref =
    await SharedPreferences.getInstance();
    setState(() {
      id = userpref.getString('id') ?? '';
    });

    print("ids${id.toString()}");
    // var pancardstream = new http.ByteStream(pancimage!.openRead());
    // pancardstream.cast();
    // var parncardlength = await pancimage!.length();



    // var addhardcardfrongstream = new http.ByteStream(addharcardfronimg!.openRead());
    // pancardstream.cast();
    // var addharfrongncardlength = await addharcardfronimg!.length();
    //
    // var addhardcardbackstream = new http.ByteStream(addharcardfrontback!.openRead());
    // pancardstream.cast();
    // var addharbackgncardlength = await addharcardfrontback!.length();

    var uri = Uri.parse('http://homliadmin.globusachievers.com/api/seller-personal');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['gender'] = gender.toString();
    request.fields['dob'] = dateofbirth.toString();
    request.fields['pan_no'] = controller.pancardnumber.text.toString();
    request.fields['aadhar_no'] = controller.addharcardnumber.text.toString();
    request.fields['id'] = id.toString();
    var pancardimage = await http.MultipartFile.fromPath("pan_image", pancimage!.path);
    request.files.add(pancardimage);

    var addharfrongcardmultiport = await http.MultipartFile.fromPath("aadhar_front_image", addharcardfrontback!.path);
    request.files.add(addharfrongcardmultiport);

    var addharbackcardmultiport = await http.MultipartFile.fromPath("aadhar_back_image", addharcardfrontback!.path);
    request.files.add(addharbackcardmultiport);

    // var pancardmultiport = new http.MultipartFile('pan_image', pancardstream, parncardlength);
    // request.files.add(pancardmultiport);
    //
    //
    // var addharfrongcardmultiport = new http.MultipartFile('aadhar_front_image', addhardcardfrongstream, addharfrongncardlength);
    // request.files.add(addharfrongcardmultiport);
    //
    // var addharbackcardmultiport = new http.MultipartFile('aadhar_back_image', addhardcardbackstream, addharbackgncardlength);
    // request.files.add(addharbackcardmultiport);


    print("All parametres"+request.toString());

    var response = await request.send();
    print(response.toString());


    var responseString = await response.stream.bytesToString();

    print(response.stream.toString());
    if (response.statusCode == 200) {
      final decodedMap = json.decode(responseString);
      if(decodedMap['status'] == "true"){
        print(""+decodedMap['msg']);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopDetails()));
        Utility().myfluttertoast("Personal Detail Uploaded Successfully");
        setState(() {
          showspinner=false;
        });
      }else{
        print("somethong wrong personal details");
        setState(() {
          showspinner=false;
        });
      }




    } else {
      setState(() {
        showspinner=false;
      });
      final decodedMap = json.decode(responseString);
      print(""+decodedMap['message']);
      print(""+decodedMap['errors']['gender']);
      print(""+decodedMap['errors']['pan_no']);
      print(""+decodedMap['errors']['aadhar_no']);

      print('failed');
      Utility().myfluttertoast("Some thing wrong data");
    }
  }

  Future getpancardphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        pancimage = File(pickfile.path);
        Utility().myfluttertoast("Pan Card Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getpancardphotocamera() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        pancimage = File(pickfile.path);
        Utility().myfluttertoast("Pan Card Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectpancarddialog(context) {
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
                      getpancardphotocamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getpancardphoto();
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

  Future getadhaarcardfrontphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        addharcardfronimg = File(pickfile.path);
        Utility().myfluttertoast("Addhar Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getadhaarcardcameraphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        showspinner=true;
        addharcardfronimg = File(pickfile.path);
        Utility().myfluttertoast("Adhaar Uploaded Successfully");
        showspinner=false;
      } else {
        showspinner=false;
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectadharrfronimagedialog(context) {
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
                      getadhaarcardcameraphoto();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getadhaarcardfrontphoto();
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

  Future getadhaarcardbackphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickfile != null) {
        addharcardfrontback = File(pickfile.path);
        Utility().myfluttertoast("Addhar Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  Future getadhaarcardbackcameraphoto() async {
    final pickfile = await pickImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickfile != null) {
        addharcardfrontback = File(pickfile.path);
        Utility().myfluttertoast("Adhaar Uploaded Successfully");
      } else {
        Utility().myfluttertoast("No Image Selected");
      }
    });
  }

  void selectadharrbackimagedialog(context) {
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
                      getadhaarcardbackcameraphoto();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text("Camera"),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getadhaarcardbackphoto();
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
}
