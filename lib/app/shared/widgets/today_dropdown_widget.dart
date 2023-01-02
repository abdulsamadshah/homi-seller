import 'package:flutter/material.dart';

class TodayDropdownWidget extends StatefulWidget {
  const TodayDropdownWidget({Key? key}) : super(key: key);

  @override
  _TodayDropdownWidgetState createState() => _TodayDropdownWidgetState();
}

class _TodayDropdownWidgetState extends State<TodayDropdownWidget> {
  String dropdownvalue = 'Today';

  var items = [
    'Today',
    'Weekly',
    'Monthly',
    'Yearly',
    'Lifetime',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: const SizedBox(),
      value: dropdownvalue,
      icon: const Icon(
        Icons.arrow_drop_down,
        size: 30,
        color: Colors.black,
      ),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: const TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
