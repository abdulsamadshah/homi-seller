import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/widgets/order_dropdown_widget.dart';

import '../../../shared/color.dart';
import '../../../shared/data.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        labelText: 'Orders',
                        labelStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(26, 26, 26, 1))),
                  ),
                  Positioned(
                      left: 280,
                      top: 22,
                      child: InkWell(
                        onTap: (() {}),
                        child: Icon(
                          Icons.search,
                          size: 30,
                          color: FixedColors.purple,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Product Order Status',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: OrderDropdownWidget(),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: info.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 250,
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Row(
                          children: [
                             Image(
                                image: AssetImage(info[index]['profilePic'].toString())),
                            Column(
                              children: [
                                Row(
                                  children: [
                                     Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                      info[index]['rank'].toString()  ,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 95),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Order details >',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                color: FixedColors.purple,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ),
                                  ],
                                ),
                              Padding(
                                  padding: EdgeInsets.only(right: 140),
                                  child: Text(
                                    info[index]['location'].toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                 Padding(
                                  padding: EdgeInsets.only(right: 140),
                                  child: Text(
                                    info[index]['quantity'].toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 140, top: 5),
                                  child: Text(
                                   info[index]['price'].toString(), 
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: FixedColors.purple,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Row(
                                  children: [
                                     Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                       info[index]['date'].toString(),
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 11,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Container(
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color.fromRGBO(
                                                235, 161, 15, 1)),
                                        child: const Center(
                                          child: Text(
                                            'Waiting for Delivery',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 8,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
