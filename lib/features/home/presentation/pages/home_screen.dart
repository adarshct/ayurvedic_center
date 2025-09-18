import 'package:ayurvedic_center/core/constants/app_colors.dart';
import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:ayurvedic_center/core/utils/extentions.dart';
import 'package:ayurvedic_center/core/widgets/app_button.dart';
import 'package:ayurvedic_center/core/widgets/custom_appbar.dart';
import 'package:ayurvedic_center/features/home/presentation/widgets/patients_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.hBox,
            CustomAppbar(),
            25.hBox,
            search(),
            25.hBox,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Device.horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sort by :"),
                  Container(
                    width: 180,
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                      underline: SizedBox(),
                      isExpanded: true,
                      value: "Date",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                      items: [
                        DropdownMenuItem(value: "Date", child: Text("Date")),
                        DropdownMenuItem(value: "Name", child: Text("Name")),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            15.hBox,
            Divider(
              color: Colors.black.withValues(alpha: 0.2),
              thickness: 1.5,
              height: 0,
            ),
            PatientsList(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Device.horizontalPadding,
              ),
              child: AppButton(onPressed: () {}, text: "Register Now"),
            ),
            30.hBox,
          ],
        ),
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Device.horizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 42,
              child: TextField(
                style: TextStyle(decorationThickness: 0),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(8.25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(8.25),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black.withValues(alpha: 0.3),
                  ),
                  hint: Text(
                    "Search for treatments",
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.2),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Device.horizontalPadding.wBox,
          AppButton(
            width: 100,
            height: 42,
            onPressed: () {},
            text: "Search",
            textSize: 14,
          ),
        ],
      ),
    );
  }
}
