import 'package:ayurvedic_center/core/utils/device.dart';
import 'package:ayurvedic_center/core/utils/extentions.dart';
import 'package:ayurvedic_center/core/widgets/app_button.dart';
import 'package:ayurvedic_center/core/widgets/app_text_field.dart';
import 'package:ayurvedic_center/features/login/presentation/provider/login_provider.dart';
import 'package:ayurvedic_center/features/login/presentation/widgets/disclaimer_text.dart';
import 'package:ayurvedic_center/features/login/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: Column(
          children: [
            LoginHeader(),
            Expanded(
              child: Consumer<LoginProvider>(
                builder: (context, provider, _) {
                  return ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: Device.horizontalPadding,
                      vertical: 25,
                    ),
                    children: [
                      Text(
                        "Login Or Register To Book Your Appointments",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      40.hBox,
                      AppTextField(
                        controller: provider.emailController,
                        label: "Email",
                        hint: "Enter your email",
                      ),
                      30.hBox,
                      AppTextField(
                        controller: provider.passwordController,
                        label: "Password",
                        hint: "Enter Password",
                      ),
                      80.hBox,
                      AppButton(
                        isLoading: provider.isLoading,
                        onPressed: () async {
                          await provider.login();
                        },
                        text: "Login",
                      ),
                    ],
                  );
                },
              ),
            ),
            DisclaimerText(),
            30.hBox,
          ],
        ),
      ),
    );
  }
}
