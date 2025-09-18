import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:ayurvedic_center/core/utils/extentions.dart';
import 'package:ayurvedic_center/core/widgets/app_text_field.dart';
import 'package:ayurvedic_center/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.hBox,
            CustomAppbar(
              onBackTap: () {
                Navigator.of(context).pop();
              },
            ),
            15.hBox,
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Register",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            10.hBox,
            const Divider(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(Device.horizontalPadding),
                children: [
                  const AppTextField(
                    label: "Name",
                    hint: "Enter your full name",
                  ),
                  25.hBox,
                  const AppTextField(
                    label: "Whatsapp Number",
                    hint: "Enter your whatsapp number",
                  ),
                  25.hBox,
                  const AppTextField(
                    label: "Address",
                    hint: "Enter your full address",
                  ),
                  25.hBox,
                  const AppTextField(
                    label: "Location",
                    hint: "Choose your location",
                  ),
                  25.hBox,
                  const AppTextField(
                    label: "Branch",
                    hint: "Choose your branch",
                  ),
                  25.hBox,
                  const Text("Treatments", style: TextStyle(fontSize: 16)),
                  5.hBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
