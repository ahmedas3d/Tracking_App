import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/country_picker_feild.dart';
import 'package:tracking_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:tracking_app/generated/l10n.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final TextEditingController firstLegalName = TextEditingController();
  final TextEditingController lastLegalName = TextEditingController();
  final GlobalKey<FormState> _formApplyKey = GlobalKey<FormState>();
  final List<Map<String, String>> countries = [
    {'name': 'Egypt', 'flag': '🇪🇬'},
    {'name': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'name': 'United Arab Emirates', 'flag': '🇦🇪'},
    {'name': 'Kuwait', 'flag': '🇰🇼'},
    {'name': 'Qatar', 'flag': '🇶🇦'},
    {'name': 'Oman', 'flag': '🇴🇲'},
    {'name': 'Iraq', 'flag': '🇮🇶'},
    {'name': 'Jordan', 'flag': '🇯🇴'},
    {'name': 'Lebanon', 'flag': '🇱🇧'},
    {'name': 'Morocco', 'flag': '🇲🇦'},
    {'name': 'Algeria', 'flag': '🇩🇿'},
    {'name': 'Tunisia', 'flag': '🇹🇳'},
    {'name': 'Libya', 'flag': '🇱🇾'},
    {'name': 'Sudan', 'flag': '🇸🇩'},
    {'name': 'Somalia', 'flag': '🇸🇴'},
  ];

  String selectedCountry = '';
  String selectedFlag = '';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
