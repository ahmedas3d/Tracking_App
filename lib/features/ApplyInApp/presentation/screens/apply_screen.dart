import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/ApplyInApp/presentation/widgets/country_picker_feild.dart';
import 'package:tracking_app/features/ApplyInApp/presentation/widgets/image_picker_field.dart';
import 'package:tracking_app/features/ApplyInApp/presentation/widgets/vehicle_type_picker_field.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_password_field.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_text_field_num.dart';
import 'package:tracking_app/generated/l10n.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController idNumber = TextEditingController();
  final TextEditingController firstLegalName = TextEditingController();
  final TextEditingController lastLegalName = TextEditingController();
  final TextEditingController vehicleNumber = TextEditingController();
  final GlobalKey<FormState> _formApplyKey = GlobalKey<FormState>();
  final ValueNotifier<String> genderNotifier = ValueNotifier<String>('male');
  String selectedVehicleType = '';
  String selectedCountry = '';
  String selectedFlag = '';
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
        title: Text(
          S.of(context).apply,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formApplyKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).welcome,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  S.of(context).wantToBeDelivery,
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                CountryPickerField(
                  selectedCountry: selectedCountry,
                  selectedFlag: selectedFlag,
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.backgroundColor,
                      context: context,
                      builder: (context) {
                        return ListView.builder(
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                countries[index]['flag']!,
                                style: const TextStyle(fontSize: 24),
                              ),
                              title: Text(countries[index]['name']!),
                              onTap: () {
                                setState(() {
                                  selectedCountry = countries[index]['name']!;
                                  selectedFlag = countries[index]['flag']!;
                                });
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                customTextField(
                  controller: firstLegalName,
                  label: S.of(context).firstLegalName,
                  hint: S.of(context).enterYourFirstLegalName,
                ),
                customTextField(
                  controller: lastLegalName,
                  label: S.of(context).lastLegalName,
                  hint: S.of(context).enterYourLastLegalName,
                ),
                VehicleTypePickerField(
                  selectedVehicleType: selectedVehicleType,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: ListView.builder(
                            itemCount: vehicleTypes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(vehicleTypes[index]),
                                onTap: () {
                                  setState(() {
                                    selectedVehicleType = vehicleTypes[index];
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                customTextFieldNum(
                  controller: vehicleNumber,
                  label: S.of(context).vehicleNumber,
                  hint: S.of(context).enterYourVehicleNumber,
                ),
                ImagePickerField(
                  hinttext: S.of(context).driverLicense,
                  onImageSelected: (File? image) {
                    if (image != null) {
                      print("تم اختيار الصورة: ${image.path}");
                    }
                  },
                ),
                customTextField(
                  controller: email,
                  label: S.of(context).email,
                  hint: S.of(context).enteryourEmail,
                ),
                customTextFieldNum(
                  controller: phoneNumber,
                  label: S.of(context).phoneNumber,
                  hint: S.of(context).enteryourPhoneNumber,
                ),
                customTextFieldNum(
                  controller: idNumber,
                  label: S.of(context).idNumber,
                  hint: S.of(context).enterYourIdNumber,
                ),
                ImagePickerField(
                  hinttext: S.of(context).uploadIdImage,
                  onImageSelected: (File? image) {
                    if (image != null) {
                      print("تم اختيار الصورة: ${image.path}");
                    }
                  },
                ),
                customPasswordField(
                  controller: password,
                  label: S.of(context).password,
                  hint: S.of(context).enteryourPassword,
                  isObscured: true,
                  validator: validatePassword,
                ),
                customPasswordField(
                  controller: confirmPassword,
                  label: S.of(context).confirmPassword,
                  hint: S.of(context).confirmPassword,
                  isObscured: true,
                  validator: (value) =>
                      validateConfirmPassword(value, password.text),
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).gender,
                      style: const TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: genderNotifier,
                      builder: (context, gender, child) {
                        return Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.primaryColor,
                              shape: const CircleBorder(),
                              value: gender == 'male',
                              onChanged: (bool? newValue) {
                                if (newValue ?? false) {
                                  genderNotifier.value = 'male';
                                }
                              },
                            ),
                            Text(
                              S.of(context).male,
                              style: const TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Checkbox(
                              activeColor: AppColors.primaryColor,
                              shape: const CircleBorder(),
                              value: gender == 'female',
                              onChanged: (bool? newValue) {
                                if (newValue ?? false) {
                                  genderNotifier.value = 'female';
                                }
                              },
                            ),
                            Text(
                              S.of(context).female,
                              style: const TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                customButton(
                  title: S.of(context).confirm,
                  onTap: () {
                    if (_formApplyKey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoutes.applySuccessfully);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(S.of(context).pleaseFillAllFields),
                          backgroundColor: AppColors.primaryColor,
                        ),
                      );
                    }
                  },
                  color: AppColors.primaryColor,
                  textColor: AppColors.textColor2,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
