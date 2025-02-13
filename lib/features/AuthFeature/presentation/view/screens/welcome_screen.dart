import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/translate_button.dart';
import 'package:tracking_app/generated/l10n.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          const TranslateButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context).welcomMassage,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            customButton(
              title: S.of(context).login,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              },
              color: AppColors.primaryColor,
              textColor: AppColors.textColor2,
            ),
            const SizedBox(
              height: 8,
            ),
            customButton(
              title: S.of(context).applyNow,
              onTap: () {},
              color: AppColors.backgroundColor,
              textColor: AppColors.greyColor,
              borderColor: AppColors.textColor3,
            ),
            const Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).version + ' 1.0.0',
                    style: const TextStyle(
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
    );
  }
}
