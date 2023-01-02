import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieWidget extends StatelessWidget {
  PieWidget({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Flutter": 5,
   
  };

  final colorList = <Color>[
    const Color.fromRGBO(0, 184, 212, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PieChart(
        
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: const Color.fromRGBO(235, 161, 15, 1),
        colorList: colorList,
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesOutside: true,
          showChartValuesInPercentage: true,
        ),
        totalValue: 10,
      ),
    );
  }
}
