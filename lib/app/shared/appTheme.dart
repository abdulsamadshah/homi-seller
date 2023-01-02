
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homlisellerapp/app/shared/utility.dart';



class MyAppTheme {
  static String notFoundImg = "https://via.placeholder.com/350x150";

  static Widget roundedTextFormField(BuildContext context,
      {bool enabled = true,
      double padding = 10,
      bool readOnly = false,
      InputDecoration? decoration,
      TextStyle? hintstyle,
      bool obscureText = false,
      TextInputType? keyboardType = TextInputType.text,
      TextInputAction? textInputAction = TextInputAction.next,
      Widget? prefix,
      Widget? suffix,
      TextEditingController? controller,
      void Function()? onEditingComplete,
      void Function(String? value)? onChanged,
      void Function()? onTap,
      void Function(String? value)? onSaved,
      void Function(String? value)? onFieldSubmitted,
      // List<TextInputFormatter>? inputFormatters,
      String? Function(String?)? validator,
      int? maxLength,
      int? maxLines,
      String? labelText,
      String? hintText,
      double? cursorHeight,
      double? width,
      String? initialValue,
      Color? fillColor,
      bool? filled,
      bool isRequired = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        width: width,
        child: TextFormField(
          cursorColor: Theme.of(context).primaryColor,
          cursorHeight: cursorHeight,
          keyboardType: keyboardType,

          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(top: 18, bottom: 18, left: 25),
             
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
              counterText: "",
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      width: 1, style: BorderStyle.solid, color: Colors.red)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 96, 96, 97))),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xffe8e8e8), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              hintText: hintText,
              hintStyle: hintstyle,
              prefix: prefix,
              filled: filled,
              fillColor: fillColor,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: suffix,
              ),
              suffixStyle: const TextStyle(color: Color(0xff90c03e))),

          onChanged: onChanged,
          // --- validate + control

          controller: controller,
          validator: validator,
          textInputAction: textInputAction,
          readOnly: readOnly,
          enabled: enabled,

          obscureText:
              Utility.isNullEmptyOrFalse(obscureText) ? false : obscureText,
          onEditingComplete: onEditingComplete,
          onSaved: onSaved,
          onTap: onTap,

          initialValue: initialValue,
          //inputFormatters: inputFormatters,
          onFieldSubmitted: onFieldSubmitted,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),

          maxLength: maxLength,
          maxLines: maxLines,
        ),
      ),
    );
  }

  static Widget roundOutlinedTextButton(
      {required String btnText,
      void Function()? onPressed,
      Color? textColor,
      double textSize = 18.0,
      double radius = 18.0,
      Color? buttonColor,
      Color? fillColor,
      Color borderColor = Colors.white}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        " " + btnText + " ",
        softWrap: false,
        style: TextStyle(
            color: textColor, fontSize: textSize, fontFamily: 'poppins'),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: borderColor)))),
    );
  }

  static Widget customizedTextFormField(BuildContext context,
      {bool enabled = true,
      bool readOnly = false,
      InputDecoration? decoration,
      TextStyle? hintstyle,
      bool obscureText = false,
      TextInputType? keyboardType = TextInputType.text,
      TextInputAction? textInputAction = TextInputAction.next,
      Widget? prefix,
      Widget? suffix,
      Widget? prefixIcon,
      TextEditingController? controller,
      void Function()? onEditingComplete,
      void Function(String? value)? onChanged,
      void Function()? onTap,
      void Function(String? value)? onSaved,
      void Function(String? value)? onFieldSubmitted,
      List<TextInputFormatter>? inputFormatters,
      String? Function(String?)? validator,
      int? maxLength,
      int? maxLines,
      String? labelText,
      String? hintText,
      double? cursorHeight,
      double? width,
      String? initialValue,
      Color? fillColor,
      bool? filled,
      bool isRequired = false}) {
    return SizedBox(
      width: width,
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        cursorHeight: cursorHeight,
        keyboardType: keyboardType,

        decoration: InputDecoration(
            enabled: enabled,
            prefixIcon: prefixIcon,
            //  const Icon(
            //       Icons.person,
            //       color: Color(0xff534A4A),
            //     ),
            // contentPadding:
            //     EdgeInsets.only(top: 18.h, bottom: 18.h, left: 25.w),

            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            counterText: "",
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    width: 1, style: BorderStyle.solid, color: Colors.red)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 96, 96, 97))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe8e8e8), width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            hintText: hintText,
            hintStyle: hintstyle,
            prefix: prefix,
            filled: filled,
            fillColor: fillColor,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: suffix,
            ),
            suffixStyle: const TextStyle(color: Color(0xff90c03e))),

        onChanged: onChanged,
        // --- validate + control

        controller: controller,
        validator: validator,
        textInputAction: textInputAction,
        readOnly: readOnly,
        enabled: enabled,

        obscureText:
            Utility.isNullEmptyOrFalse(obscureText) ? false : obscureText,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        onTap: onTap,

        initialValue: initialValue,
        //inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        style: const TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),

        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }

  // static Widget roundOutlinedTextButton(
  //     {required String btnText,
  //     void Function()? onPressed,
  //     Color? textColor,
  //     double textSize = 18.0,
  //     double radius = 18.0,
  //     Color? buttonColor,
  //     Color? fillColor,
  //     Color borderColor = Colors.white}) {
  //   return TextButton(
  //     onPressed: onPressed,
  //     child: Text(
  //       " " + btnText + " ",
  //       softWrap: false,
  //       style: TextStyle(
  //           color: textColor, fontSize: textSize, fontFamily: 'poppins'),
  //     ),
  //     style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all(buttonColor),
  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //             RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(radius),
  //                 side: BorderSide(color: borderColor)))),
  //   );
  // }
}
