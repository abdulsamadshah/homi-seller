import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:homlisellerapp/app/constants/colors.dart';
import 'package:homlisellerapp/app/constants/fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../shared/widgets/sidemenu.dart';
import 'datepicker.dart';
import 'package:pie_chart/pie_chart.dart';
class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
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
            child: Text('Sales report',style: TextStyle(fontFamily: PoppinsMedium,fontSize: 16,color: Color(0xff1E1E1E)),),

          ),
        ],
      ),
      drawer: const Sidemenu(),

      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>DonutPieChart(animate: true,)));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 143,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Appcolors.ButtonColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Column(
                                children: [
                                  Center(child: Text("100K",style: TextStyle(fontSize: 30,fontFamily: PoppinsSemibold,color: Colors.white),)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(child: Text("Profile View",style: TextStyle(fontSize: 14,fontFamily: PoppinsMedium,color: Colors.white),))

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Row(
                      children: [
                        Container(
                          height: 143,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Appcolors.ButtonColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Center(child: Text("100",style: TextStyle(fontSize: 30,fontFamily: PoppinsSemibold,color: Colors.white),)),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: Text("Product View",style: TextStyle(fontSize: 14,fontFamily: PoppinsMedium,color: Colors.white),))

                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(width: 20,),
                    Row(
                      children: [
                        Container(
                          height: 143,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Appcolors.ButtonColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Center(child: Text("85",style: TextStyle(fontSize: 30,fontFamily: PoppinsSemibold,color: Colors.white),)),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: Text("Total Order",style: TextStyle(fontSize: 14,fontFamily: PoppinsMedium,color: Colors.white),))

                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(width: 20,),
                    Row(
                      children: [
                        Container(
                          height: 143,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Appcolors.ButtonColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Center(child: Text("25",style: TextStyle(fontSize: 30,fontFamily: PoppinsSemibold,color: Colors.white),)),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: Text("Total Delivered ",style: TextStyle(fontSize: 14,fontFamily: PoppinsMedium,color: Colors.white),))

                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(width: 20,),
                    Row(
                      children: [
                        Container(
                          height: 143,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Appcolors.ButtonColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Center(child: Text("65",style: TextStyle(fontSize: 30,fontFamily: PoppinsSemibold,color: Colors.white),)),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: Text("Total Cancelled",style: TextStyle(fontSize: 14,fontFamily: PoppinsMedium,color: Colors.white),))

                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(width: 20,),
                    Row(
                      children: [
                        Container(
                          height: 143,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Appcolors.ButtonColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Center(child: Text("20",style: TextStyle(fontSize: 30,fontFamily: PoppinsSemibold,color: Colors.white),)),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(child: Text("Total Return ",style: TextStyle(fontSize: 14,fontFamily: PoppinsMedium,color: Colors.white),))

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),


              ),

            ),
            // Container(
            //   child: Column(
            //     children: [
            //       PieChart(dataMap: dataMap,
            //         animationDuration: Duration(milliseconds: 800),
            //         chartLegendSpacing: 32,
            //         chartRadius: MediaQuery.of(context).size.width / 3.2,
            //         colorList: colorList,
            //         initialAngleInDegree: 0,
            //         chartType: ChartType.ring,
            //         ringStrokeWidth: 32,
            //         centerText: "HYBRID",
            //         legendOptions: LegendOptions(
            //           showLegendsInRow: false,
            //           legendPosition: LegendPosition.right,
            //           showLegends: true,
            //           legendShape: _BoxShape.circle,
            //           legendTextStyle: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         chartValuesOptions: ChartValuesOptions(
            //           showChartValueBackground: true,
            //           showChartValues: true,
            //           showChartValuesInPercentage: false,
            //           showChartValuesOutside: false,
            //           decimalPlaces: 1,
            //         ),
            //         // gradientList: ---To add gradient colors---
            //         // emptyColorGradient: ---Empty Color gradient---
            //       )
            //
            //
            //     ],
            //   ),
            // )

            Container(
              child: Column(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


