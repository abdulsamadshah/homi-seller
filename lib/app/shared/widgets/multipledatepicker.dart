import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/View/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MultipleDatePicker extends StatefulWidget {
  const MultipleDatePicker({super.key});

  @override
  State<MultipleDatePicker> createState() => _MultipleDatePickerState();
}

class _MultipleDatePickerState extends State<MultipleDatePicker> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        SfDateRangePicker(
          view: DateRangePickerView.month,
          monthViewSettings:
              DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
          selectionMode: DateRangePickerSelectionMode.multiple,
          enableMultiView: true,
          showActionButtons: true,
          onSubmit: (val) {
            print(val);
          },
        );
      },
      child: Text(DateTime.now.toString()),
    );
  }
}
