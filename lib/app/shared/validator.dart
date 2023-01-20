import 'package:homlisellerapp/app/shared/utility.dart';

class Validator {
  static String? validateEmail(String? value) {
    String patttern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(patttern);
    value = value?.trim();
    if (value == null) {
      return 'Email address cannot be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validateMobile(String? value) {
    String patttern = r'(^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return "Please enter a valid phone number";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static String? validateAadhar(String? value) {
    // String patttern = r'(^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$)';
    // RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return "Please enter a valid Aadhar number";
    }
    return null;
  }

  static String? validatepandCard(String? value) {
    // String patttern = r'(^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$)';
    // RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return "Please enter a valid Pan number";
    }
    return null;
  }


  static String? validateAadharcard(String? value) {
    String pattern = r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$';
    RegExp regExp = RegExp(pattern);
    if (value==null) {
      return 'Please Enter Aadhar card Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Aadhar card Number';
    }
    return "";
  }

  static String? validatePancard(String? value) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    RegExp regExp = RegExp(pattern);
    if (value==null) {
      return 'Please Enter Pancard Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Pancard Number';
    }
    return "";
  }


  static String? validatePassword(String? value) {
    if (value == null) {
      return 'Password is required';
    } else if (value.contains(' ')) {
      return 'Password should not contain space';
    } else if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be minimum 6 character';
    } else {
      return null;
    }
  }


  static String? validateFffsairegisterationnumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid FSSAI Registration Number";
    }else if(value.length > 14){
      return "Please enter the 14 digit number";
    }else if(value.length < 14){
      return "Please enter the 14 digit number";
    }else if(value.contains(' ')){
      return 'FSSAI Registration Number should not contain space';
    }else{

    }
  }

  // static String? validatePancard(String? value) {
  //   if (value == null) {
  //     return "Please enter a valid Pancard";
  //   } else if (value.isEmpty) {
  //     return "Please enter a valid Pancard";
  //   } else {
  //     return null;
  //   }
  // }

  static String? validateIfsc(String? value) {
    if (value == null) {
      return "Please enter a valid Ifsc code";
    } else if (value.isEmpty) {
      return "Please enter a valid Ifsc code";
    } else {
      return null;
    }
  }

  static String? validateAccountNumber(String? value) {
    if (value == null) {
      return "Please enter a valid Account Number";
    } else if (value.isEmpty) {
      return "Please enter a valid Account Number";
    } else {
      return null;
    }
  }

  static String? validateBankName(String? value) {
    if (value == null) {
      return "Please enter a valid Bank Name";
    } else if (value.isEmpty) {
      return "Please enter a valid Bank Name";
    } else {
      return null;
    }
  }

  static String? validateName(String? value) {
    String pattern = r'(^[A-Za-z]+([\ A-Za-z]+)*$)';
    RegExp regExp = RegExp(pattern);
    if (value == null || !regExp.hasMatch(value)) {
      return "Please enter a valid name";
    } else {
      return null;
    }
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid Mobile number";
    }
  }

  static String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid Mobile number";
    }else if(value.length > 6){
      return "Please enter the six digit number";
    }else if(value.length < 6){
      return "Please enter the six digit number";
    }else{

    }
  }

  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty || value == "") {
      Utility().myfluttertoast("Mobile Number is empty");
    } else if (value.length >
        10) {
      Utility().myfluttertoast(
          "Please enter the ten digit mobile Number");
    } else if (value.length < 10) {
      Utility().myfluttertoast(
          "Please enter the ten digit mobile Number");
    }else{
      Utility().myfluttertoast("Enter The Valid Mobile Number");
    }
  }
  //
  // String validatepannumbers(String value) {
  //
  //   // regex = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
  //   String pattern = '[A-Z]{5}[0-9]{4}[A-Z]{1}';
  //   RegExp regExp = RegExp(pattern);
  //   if (value.isEmpty) {
  //     return 'Please Enter ';
  //   } else if (!regExp.hasMatch(value)) {
  //     return 'Please Enter valid IFSC';
  //   }
  //   return "";






}
