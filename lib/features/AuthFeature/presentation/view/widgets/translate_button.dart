import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:tracking_app/generated/l10n.dart';
import 'package:tracking_app/main.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language, color: AppColors.primaryColor),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          backgroundColor: AppColors.backgroundColor,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customButton(
                    title: S.of(context).english,
                    onTap: () {
                      TrackingApp.setLocale(context, const Locale('en'));
                      Navigator.pop(context);
                    },
                    color: AppColors.primaryColor,
                    textColor: AppColors.textColor2,
                  ),
                  const SizedBox(height: 10),
                  customButton(
                    title: S.of(context).arabic,
                    onTap: () {
                      TrackingApp.setLocale(context, const Locale('ar'));
                      Navigator.pop(context);
                    },
                    color: AppColors.backgroundColor,
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
