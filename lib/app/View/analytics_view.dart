import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homlisellerapp/app/constants/fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import '../shared/widgets/sidemenu.dart';

class AnalyticsView extends StatelessWidget {
   AnalyticsView({super.key});

   // final gradientList = <List<Color>>[
   //   [
   //     Color.fromRGBO(223, 250, 92, 1),
   //     Color.fromRGBO(129, 250, 112, 1),
   //   ],
   //   [
   //     Color.fromRGBO(129, 182, 205, 1),
   //     Color.fromRGBO(91, 253, 199, 1),
   //   ],
   //   [
   //     Color.fromRGBO(175, 63, 62, 1.0),
   //     Color.fromRGBO(254, 154, 92, 1),
   //   ]
   // ];

  Map<String, double> dataMap = {
    "Buttermilk": 3,
    "Amti": 4,
    "Solkadhi": 4,


  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Text('Analytics',style: TextStyle(fontFamily: PoppinsMedium,fontSize: 16,color: Color(0xff1E1E1E)),),

            ),
          ],
        ),
        drawer: const Sidemenu(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          child: Column(
            children: [

              PieChart(
                // gradientList: gradientList,
                // emptyColorGradient: [
                //   Color(0xff6c5ce7),
                //   Colors.blue,
                // ],
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 1.3,
                // colorList: colorList,
                initialAngleInDegree: 0,

                chartType: ChartType.disc,
                ringStrokeWidth: 32,

                // centerText: "HYBRID",
                legendOptions: LegendOptions(
                  showLegendsInRow: true,
                  legendPosition: LegendPosition.bottom,
                  showLegends: true,
                  // legendShape: Boxt,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),

              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 75),
                child: Text('Total  Product Sale Report',style: TextStyle(fontSize: 12,color: Colors.black,fontFamily: PoppinsSemibold),),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70),
                child: Divider(height: 1,color: Colors.black,),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('order list ',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsSemibold),),
                    Text('Sales',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsSemibold),),
                  ],
                ),

              ),
              SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70),
                child: Divider(height: 1,color: Colors.black,),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Buttermilk',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsMedium),),
                    Text('300',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsMedium),),
                  ],
                ),

              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amti',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsMedium),),
                    Text('100',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsMedium),),
                  ],
                ),

              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Solkadhi',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsMedium),),
                    Text('600',style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: PoppinsMedium),),
                  ],
                ),

              ),

            ],
          ),
        ),
      )


    );
  }
}