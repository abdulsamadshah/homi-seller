import 'package:flutter/material.dart';

class OrderDropdownWidget extends StatefulWidget {
  const OrderDropdownWidget({Key? key}) : super(key: key);

  @override
  _OrderDropdownWidgetState createState() => _OrderDropdownWidgetState();
}

class _OrderDropdownWidgetState extends State<OrderDropdownWidget> {
  String dropdownvalue = 'Today';

  var items = [
    'Today',
    'Placed',
    'Accepted',
    'Waiting for Delivery',
    'Partial Delivery',
    'Delivered',
    'Returned',
    'Return in Process',
    'Return Requested',
    'Cancelled',
    'Handed over for Delivery'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.black, style: BorderStyle.solid, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButton(
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
                    fontSize: 15,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
