import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/color.dart';

class RadioContainerWidget extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  const RadioContainerWidget(
      {super.key, required this.titleOne, required this.titleTwo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 49,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => FixedColors.purple),
                  value: 0,
                  groupValue: 0,
                  onChanged: null,
                ),
                Text(
                  titleOne,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(108, 93, 93, 0.8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => FixedColors.purple),
                      value: 0,
                      groupValue: 0,
                      onChanged: null),
                  Text(
                    titleTwo,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(108, 93, 93, 0.8),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
