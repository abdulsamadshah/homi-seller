import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homlisellerapp/app/shared/widgets/dropdown_widget.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../View_Model/Addproduct_Controller.dart';
import '../../model/Category.dart';
import '../../model/Cuisine_model.dart';
import '../../model/SubSubCategory_model.dart';
import '../../service/dropdown.service.dart';
import '../../shared/color.dart';
import '../../shared/widgets/choose_file_widget.dart';



class AddKhanaFormOneView extends StatelessWidget {
   AddKhanaFormOneView({super.key});

  dynamic maincategoryId;
  dynamic maincategoryitemselected;

  dynamic SubcategoryId;
  dynamic Subcategoryitemselected;

   final AddproductController controller = Get.put(AddproductController());

   List subjectData = [];
   List CuisinetData = [];
   Dropdownservice object=Dropdownservice();


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // controller.fetchSubSubCategory();
      controller.getSubSubCategory();
      controller.getCuisineCategory();

    });
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>MultiSelect()));
              },
              child: Padding(
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


            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 45,
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
                      return "Please select a Category";
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
                        color: Colors.black12,
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
                            "Category",
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
                      return "No Category selected";
                    }
                  },
                  selectedItem: maincategoryitemselected,
                  onFind: (String? filter) {
                    return Dropdownservice().getmainCategory();
                  },
                  onChanged: (value) {
                    maincategoryitemselected = value;
                    maincategoryId = maincategoryitemselected['id'];
                    print(maincategoryId);
                    controller.SaveMainCategoryId(maincategoryId.toString());

                  },
                ),
              ),
            ),



            SizedBox(
              height: 10,
            ),
            // DropdownWidget(title: 'Sub Category'),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: 45,
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
                      return "Sub Category";
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
                        color: Colors.black12,
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
                            "Sub Category",
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
                      return "No Sub Category selected";
                    }
                  },
                  selectedItem: Subcategoryitemselected,
                  onFind: (String? filter) {
                    return Dropdownservice().getSubCategory();
                  },
                  onChanged: (value) {
                    Subcategoryitemselected = value;
                    SubcategoryId = Subcategoryitemselected['id'];
                    print(SubcategoryId);
                    controller.SavesubcategoryId(SubcategoryId.toString());
                    controller.getSubSubCategory();

                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            GetBuilder<AddproductController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: MultiSelectDialogField(
                  // height: 200,

                  items: controller.SubsubCategoryDropdownData,
                  title: const Text(
                    "Select Sub Sub Category",
                    style: TextStyle(color: Colors.black),
                  ),
                  selectedColor: Colors.black,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  buttonIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  buttonText: const Text(
                    "Select Sub Sub Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                    subjectData = [];
                    for (var i = 0; i < results.length; i++) {
                      SubSubCategory data = results[i] as SubSubCategory;
                      print(data.name);
                      print(data.id);
                      subjectData.add(data.id);
                      controller.SavesubsubcategoryId(data.id);

                    }
                    print("Category Data $subjectData");

                    //_selectedAnimals = results;
                  },
                ),
              );
            }),



            SizedBox(
              height: 10,
            ),
            GetBuilder<AddproductController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: MultiSelectDialogField(
                  // height: 200,

                  items: controller.CuisineCategoryDropdownData,
                  title: const Text(
                    "Select Cuisine Category",
                    style: TextStyle(color: Colors.black),
                  ),
                  selectedColor: Colors.black,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  buttonIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                  buttonText: const Text(
                    "Cuisine",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                    CuisinetData = [];
                    for (var i = 0; i < results.length; i++) {
                      Cuisine data = results[i] as Cuisine;
                      print(data.name);
                      print(data.id);
                      CuisinetData.add(data.id);
                      controller.SavesubsubcategoryId(data.id);

                    }
                    print("Category Data $subjectData");

                    //_selectedAnimals = results;
                  },
                ),
              );
            }),
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
            // const Padding(
            //   padding: EdgeInsets.only(left: 25),
            //   child: Text(
            //     'Add Product',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontFamily: 'Poppins',
            //         fontSize: 25,
            //         fontWeight: FontWeight.w500),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 25),
            //   child: Text(
            //     'Please fill product details',
            //     style: TextStyle(
            //         color: Colors.grey,
            //         fontFamily: 'Poppins',
            //         fontSize: 20,
            //         fontWeight: FontWeight.w400),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
           
                   const ChooseFileWidget(hinttext: 'Product Image', subtitle: 'Choose File',),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Center(
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
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const NumberOtpView()));
              },
              child: Center(
                child: Container(
                  width: 320,
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
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
