import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:tracking_app/generated/l10n.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formForgotKey = GlobalKey<FormState>();
  bool _isLoading = false;
  // void _resetPassword() {
  //   if (_formForgotKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     // Simulate API call
  //     Future.delayed(const Duration(seconds: 2), () {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Please check your email')),
  //       );
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter your email')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          S.of(context).password,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Form(
          key: _formForgotKey,
          child: Column(
            children: [
              Text(
                S.of(context).forgetPassword,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor1,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).pleaseEnterYourEmail,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(height: 15),
              customTextField(
                controller: email,
                label: S.of(context).email,
                hint: S.of(context).enteryourEmail,
              ),
              const SizedBox(height: 35),
              _isLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor)
                  : customButton(
                      title: S.of(context).confirm,
                      color: AppColors.primaryColor,
                      textColor: AppColors.textColor2,
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.emailVerificationScreen);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
