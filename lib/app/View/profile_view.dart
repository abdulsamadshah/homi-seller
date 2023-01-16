import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/View/edit_profile_one.dart';

import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/widgets/divider_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: FixedColors.purple,
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/png/homilylogo.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Nikhil Maurya',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 60, bottom: 20),
                        child: Text(
                          'Zrow Solution',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
              ),
              Icon(
                Icons.person_outline,
                color: FixedColors.purple,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'N-Zrow',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const DividerWidget(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
              ),
              Icon(
                Icons.phone,
                color: FixedColors.purple,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                '9923967755',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const DividerWidget(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
              ),
              Icon(
                Icons.message,
                color: FixedColors.purple,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Nikhil.Zrow@gmail.com',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const DividerWidget(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
              ),
              Icon(
                Icons.document_scanner,
                color: FixedColors.purple,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Documents',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const DividerWidget(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
              ),
              Icon(
                Icons.location_city,
                color: FixedColors.purple,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Wadala, Mumbai',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const DividerWidget(),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfileOne()));
            },
            child: Center(
              child: Container(
                width: 175,
                height: 44,
                decoration: BoxDecoration(
                  color: FixedColors.purple,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);

    path.quadraticBezierTo(w * 0.5, h - 60, w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
