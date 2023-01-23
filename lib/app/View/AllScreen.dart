import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../service/dropdown.service.dart';
import '../shared/validator.dart';

class Alscree extends StatefulWidget {
  const Alscree({Key? key}) : super(key: key);

  @override
  State<Alscree> createState() => _AlscreeState();
}


class _AlscreeState extends State<Alscree> {


 TextEditingController controllers=TextEditingController();
 final GlobalKey<FormState> loginKeys = GlobalKey<FormState>();

 dynamic stateid;
 dynamic stateitemselected;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("as"),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            child: DropdownSearch<dynamic>(
              enabled: true,
              popupTitle: const Text(
                "Select Job Category",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
              popupBackgroundColor: Colors.white,
              validator: (value) {
                if (value == null) {
                  return "Please select a valid Job Category";
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
                  left: 18.0,
                  top: 8.0,
                  bottom: 8.0,
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: (selectedItem?['id'] == null)
                      ? Row(
                    children: const [
                      Text(
                        "Job Category",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
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
                      fontSize: 18,
                    ),
                  ),
                );
              },
              mode: Mode.DIALOG,
              itemAsString: (dynamic u) {
                if (u?.name != null) {
                  return u!.name.toString();
                } else {
                  return "No Job Category";
                }
              },

              selectedItem: stateitemselected,
              onFind: (String? filter) {
                return Dropdownservice().getStateData();
              },
              onChanged: (value) {
                stateitemselected = value;
                stateid = stateitemselected['id'];
                print(stateid);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ListTile(
// title: Text("Male"),
// leading: Radio(
// value: Genderdata.Male,
// groupValue: gender,
// onChanged: (Genderdata? value) {
// setState(() {
// gender = value!;
// });
// },
//
// ),
// ),
// ListTile(
// title: Text("Other"),
// leading: Radio(
// value: Genderdata.Other,
// groupValue: gender,
// onChanged: (Genderdata? value) {
// setState(() {
// gender = value!;
// });
// },
//
// ),
// ),
