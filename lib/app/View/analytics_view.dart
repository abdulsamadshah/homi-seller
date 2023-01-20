import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/widgets/analytics_order.dart';
import 'package:homlisellerapp/app/shared/widgets/multipledatepicker.dart';
import 'package:homlisellerapp/app/shared/widgets/sidemenu.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'order': 'A',
        'percentage': 40,
      },
      {
        'order': 'B',
        'percentage': 60,
      }
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Text(
                'Analytics',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        drawer: const Sidemenu(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                      Text('Back'),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnalyticsOrder(
                      icon: Icon(
                        Icons.savings,
                        color: Color(0xffF8F8F8),
                      ),
                      title: '100K',
                      subtitle: 'Monthly Earning',
                    ),
                    AnalyticsOrder(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Color(0xffF8F8F8),
                      ),
                      title: '100',
                      subtitle: 'Monthly Order',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sales Report',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MultipleDatePicker(),
                    Text('To'),
                    MultipleDatePicker(),
                  ],
                ),
                SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    children: [
                      DChartPie(
                        data: data.map((e) {
                          return {
                            'domain': e['order'],
                            'measure': e['percentage']
                          };
                        }).toList(),
                        fillColor: (pieData, index) {
                          switch (pieData['domain']) {
                            case 'A':
                              return Colors.blue;
                            case 'B':
                              return Colors.orange;
                          }
                        },
                        labelPosition: PieLabelPosition.auto,
                        labelColor: Colors.black,
                        labelFontSize: 14,
                        labelLineColor: Colors.amber,
                        labelLineThickness: 2,
                        labelLinelength: 10,
                        labelPadding: 5,
                        pieLabel: (Map<dynamic, dynamic> pieData, int? index) {
                          return "Order" +
                              " " +
                              pieData['domain'] +
                              '\n' +
                              '(' +
                              pieData['measure'].toString() +
                              '%' +
                              ')';
                        },
                        showLabelLine: true,
                        donutWidth: 25,
                      ),
                      Center(
                        child: Text('Total Sales'),
                      ),
                    ],
                  ),
                ),

                // PieWidget(),
                SizedBox(height: 20),
                Divider(
                  color: Color(0xff858585),
                  thickness: 2,
                ),
                SizedBox(height: 20),
                Text(
                  'Order List',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      shadowColor: Colors.white,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        leading: Text(
                          'Order A',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        title: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff2B87E3),
                          ),
                        ),
                        trailing: Text(
                          '400',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      shadowColor: Colors.white,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        leading: Text(
                          'Order B',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        title: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEBA10F),
                          ),
                        ),
                        trailing: Text(
                          '600',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
