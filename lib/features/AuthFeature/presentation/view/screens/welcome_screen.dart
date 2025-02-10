import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              const Image(
                image: AssetImage(
                  'assets/images/welcom_screen.png',
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Welcome to\nFlowery rider app',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              customButton(
                title: 'Login',
                onTap: () {},
                color: AppColors.primaryColor,
                textColor: AppColors.textColor2,
              ),
              const SizedBox(
                height: 8,
              ),
              customButton(
                title: 'Apply Now',
                onTap: () {},
                color: AppColors.backgroundColor,
                textColor: AppColors.greyColor,
                borderColor: AppColors.textColor3,
              ),
              const Spacer(
                flex: 3,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
