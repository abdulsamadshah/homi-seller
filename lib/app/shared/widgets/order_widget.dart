import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:homlisellerapp/app/shared/color.dart';

class OrderWidget extends StatefulWidget {
  final Color color;
  final AssetImage image;
  final String percent;
  final String title;
  final String subTitle;
  const OrderWidget(
      {super.key,
      required this.color,
      required this.image,
      required this.percent,
      required this.title,
      required this.subTitle});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 145,
      decoration: BoxDecoration(
          color: FixedColors.purple, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Image(image: widget.image)),
                ),
              ),
              Row(
                children: [
                  const Text(
                    '+',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.percent,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    '%',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const Icon(
                    Icons.arrow_upward,
                    size: 17,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.subTitle,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
