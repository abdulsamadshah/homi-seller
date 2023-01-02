import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropdownWidget extends StatefulWidget {
  final String title;
  const DropdownWidget({super.key, required this.title});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
//  String dropdownvalue = 'Maharashtra';

  var items = [
    'Maharashtra',
    'Karnataka',
    'Punjab',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:MediaQuery.of(context).size.width * 0.9,
        height: 49,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(108, 93, 93, 0.8),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 100,
              ),
              Flexible(
                child: DropdownButton(
                  underline: const SizedBox(),
                  menuMaxHeight: 150,
                  focusColor: const Color(0xffE5E5E5),
                  dropdownColor: const Color(0xffE5E5E5),
                  isExpanded: true,
                  // value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Color(0xff534A4A)),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(108, 93, 93, 0.8),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                  // onChanged: (String? newValue) {
                  //   setState(() {
                  //     dropdownvalue = newValue!;
                  //   });
                  // },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
