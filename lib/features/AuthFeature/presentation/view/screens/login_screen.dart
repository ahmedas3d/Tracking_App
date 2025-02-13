import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:tracking_app/generated/l10n.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();

  bool rememberPassword = false;
  bool _isObscured = true;
  bool _isLoading = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    email.addListener(_validateFields);
    password.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      _isButtonEnabled = email.text.isNotEmpty && password.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
        title: Text(
          S.of(context).login,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
        child: Form(
          key: _formLoginKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              children: [
                customTextField(
                  controller: email,
                  label: S.of(context).email,
                  hint: S.of(context).enteryourEmail,
                ),
                const SizedBox(height: 20),
                customTextField(
                  controller: password,
                  label: S.of(context).password,
                  hint: S.of(context).enteryourPassword,
                  visibleIcon: Icons.visibility_off,
                  hiddenIcon: Icons.visibility,
                  isObscured: _isObscured,
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                rememberPassword = value;
                              });
                            }
                          },
                          activeColor: AppColors.primaryColor,
                        ),
                        Text(
                          S.of(context).rememberpassword,
                          style: const TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.forgotPasswordScreen);
                      },
                      child: Text(
                        S.of(context).forgotpassword,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.greyColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                customButton(
                  title: S.of(context).login,
                  onTap: () {
                    if (_isButtonEnabled) {
                      if (_formLoginKey.currentState!.validate()) {
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(S.of(context).pleaseFillAllFields),
                            backgroundColor: AppColors.primaryColor,
                          ),
                        );
                      }
                    }
                  },
                  color:
                      _isButtonEnabled ? AppColors.primaryColor : Colors.grey,
                  textColor: AppColors.textColor2,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
