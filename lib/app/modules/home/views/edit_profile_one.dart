import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/modules/home/views/edit_profile_two.dart';

import 'package:homlisellerapp/app/shared/color.dart';

class EditProfileOne extends StatelessWidget {
  const EditProfileOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: FixedColors.purple,
              height: 250,
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 42,
                            backgroundImage: NetworkImage(
                                'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                            backgroundColor: Colors.black,
                          ),
                          Positioned(
                              bottom: 0,
                              left: 50,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: Icon(
                                  Icons.add_a_photo_rounded,
                                  color: FixedColors.purple,
                                  size: 20,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Zrow Solution',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Nikhil Maurya',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(133, 133, 133, 1))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              children: [
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(133, 133, 133, 1))),
                ),
                Positioned(
                    left: 250,
                    top: 10,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'confirm',
                          style: TextStyle(
                              color: FixedColors.purple, fontSize: 15),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              children: [
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(133, 133, 133, 1))),
                ),
                Positioned(
                    left: 250,
                    top: 10,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'confirm',
                          style: TextStyle(
                              color: FixedColors.purple, fontSize: 15),
                        )))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Seller Address',
                  labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(133, 133, 133, 1))),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",
                          style: TextStyle(
                              color: FixedColors.purple,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 20))),
                ),
                InkWell(
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfileTwo()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 142,
                      height: 39,
                      decoration: BoxDecoration(
                        color: FixedColors.purple,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
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

    path.quadraticBezierTo(w, h, w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
