import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, this.onBackTap});

  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Device.horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackTap,
            child: Icon(Icons.arrow_back, size: 28),
          ),
          Stack(
            children: [
              Icon(Icons.notifications_none, size: 28),
              Positioned(
                right: 4,
                top: 4,
                child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
