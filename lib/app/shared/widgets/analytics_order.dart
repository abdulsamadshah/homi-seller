import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/color.dart';

class AnalyticsOrder extends StatefulWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  const AnalyticsOrder({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<AnalyticsOrder> createState() => _AnalyticsOrderState();
}

class _AnalyticsOrderState extends State<AnalyticsOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      width: 155,
      decoration: BoxDecoration(
        color: FixedColors.purple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(width: 50, height: 50, child: widget.icon),
          ),
          const SizedBox(height: 12),
          Center(
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
            height: 28,
          ),
          Center(
            child: Text(
              widget.subtitle,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
