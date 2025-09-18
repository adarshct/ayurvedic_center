import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DisclaimerText extends StatelessWidget {
  const DisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Device.horizontalPadding),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          children: [
            const TextSpan(
              text:
                  'By creating or logging into an account you are agreeing with our ',
            ),
            clickableText("Terms and Conditions"),
            const TextSpan(text: ' and '),
            clickableText("Privacy Policy"),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  TextSpan clickableText(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
      recognizer: TapGestureRecognizer()..onTap = () {},
    );
  }
}
