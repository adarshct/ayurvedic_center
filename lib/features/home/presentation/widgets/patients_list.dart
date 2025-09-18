import 'package:ayurvedic_center/core/constants/app_colors.dart';
import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:ayurvedic_center/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: Device.horizontalPadding,
          vertical: 12,
        ),
        itemBuilder: (context, index) {
          return patientTile();
        },
        separatorBuilder: (context, index) => 15.hBox,
        itemCount: 10,
      ),
    );
  }

  Widget patientTile() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldColor,
        borderRadius: BorderRadius.circular(8.25),
      ),
      child: Column(
        children: [
          topPart(),
          Divider(color: Colors.black.withValues(alpha: 0.2), height: 5),
          bottomPart(),
        ],
      ),
    );
  }

  Widget topPart() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1.",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          10.wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vikram Singh",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                5.hBox,
                Text(
                  "Couple Combo package",
                  style: TextStyle(color: AppColors.appGreen, fontSize: 13),
                ),
                12.hBox,
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 15,
                      color: AppColors.appRed,
                    ),
                    3.wBox,
                    Text(
                      "02/03/2025",
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontSize: 13,
                        height: 0.5,
                      ),
                    ),
                    15.wBox,
                    Icon(
                      Icons.people_outline,
                      size: 15,
                      color: AppColors.appRed,
                    ),
                    Expanded(
                      child: Text(
                        "Jithesh",
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 13,
                          height: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomPart() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 35, right: 15, top: 8, bottom: 10),
        child: Row(
          children: [
            Expanded(child: Text("View booking details")),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.appGreen,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
