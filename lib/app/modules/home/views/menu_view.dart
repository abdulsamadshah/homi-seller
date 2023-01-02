import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/widgets/order_widget.dart';

import 'package:homlisellerapp/app/shared/widgets/sidemenu.dart';
import 'package:homlisellerapp/app/shared/widgets/today_dropdown_widget.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const Sidemenu(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Hi, N-Zrow',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 29,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Dec,10,2022 ',
                        style: TextStyle(
                            color: Color.fromRGBO(133, 133, 133, 1),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage('assets/images/png/homilylogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: TodayDropdownWidget(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OrderWidget(
                  color: Color.fromRGBO(5, 0, 255, 0.9),
                  image: AssetImage('assets/images/png/docc1.png'),
                  percent: '12',
                  subTitle: 'Placed Order',
                  title: '60',
                ),
                SizedBox(
                  width: 5,
                ),
                OrderWidget(
                  color: Color.fromRGBO(255, 0, 0, 1),
                  image: AssetImage('assets/images/png/doc2.png'),
                  percent: '11',
                  subTitle: 'Accepted Order',
                  title: '10',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OrderWidget(
                  color: Color.fromRGBO(117, 227, 79, 1),
                  image: AssetImage('assets/images/png/doc3.png'),
                  percent: '12',
                  subTitle: 'Cancelled Order',
                  title: '100',
                ),
                SizedBox(
                  width: 5,
                ),
                OrderWidget(
                  color: Color.fromRGBO(0, 184, 212, 1),
                  image: AssetImage('assets/images/png/doc4.png'),
                  percent: '12',
                  subTitle: 'Delivered Order',
                  title: '50',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sales Achived',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                TextButton(
                    onPressed: (() {}),
                    child: const Text(
                      'See All Report ',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 111, 253, 1),
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
