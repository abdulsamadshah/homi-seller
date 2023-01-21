import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/color.dart';
import 'package:intl/intl.dart';

class MultipleDatePicker extends StatefulWidget {
  const MultipleDatePicker({super.key});

  @override
  State<MultipleDatePicker> createState() => _MultipleDatePickerState();
}

class _MultipleDatePickerState extends State<MultipleDatePicker> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 120,
      child: TextField(
        controller: dateinput,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.calendar_today,
            size: 12,
          ),
        ),
        style: TextStyle(fontSize: 8, color: Colors.black),
        readOnly: true,
        onTap: () async {
          DateTime? pickeddate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
            builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: FixedColors.purple,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            ),
            confirmText: 'Apply',
            cancelText: 'cancel',
          );

          if (pickeddate != null) {
            String formattedDate = DateFormat("dd/mm/yyyy").format(pickeddate);
            setState(
              () {
                dateinput.text = formattedDate.toString();
              },
            );
          } else {
            print('Not seleccted');
          }
        },
      ),
    );
  }
}
