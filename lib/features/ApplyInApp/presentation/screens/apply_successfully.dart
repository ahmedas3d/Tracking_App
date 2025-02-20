import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:tracking_app/generated/l10n.dart';

class ApplySuccessfully extends StatelessWidget {
  const ApplySuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          SvgPicture.asset(
            'assets/images/check-circle.svg',
          ),
          const SizedBox(height: 5),
          Text(
            textAlign: TextAlign.center,
            S.of(context).yourApplicationSubmitted,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            S.of(context).yourApplicationWillBeReviewed,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: customButton(
              title: S.of(context).login,
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.welcomeScreen);
              },
              color: AppColors.primaryColor,
              textColor: AppColors.textColor2,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SvgPicture.asset(
            'assets/images/wave.svg',
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
