import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/widgets/wide_button.dart';
import 'package:flutter_nomad_study_v2/contants/gaps.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterPolicyScreen extends StatelessWidget {
  const TwitterPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Sizes.size80,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Padding(
            padding: EdgeInsets.only(left: Sizes.size16),
            child: Row(children: [Icon(Icons.arrow_back)]),
          ),
        ),
        title: Image.asset(
          'assets/images/twitter_logo.png',
          width: Sizes.size32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size16,
          ),
          child: Column(
            children: [
              const Text(
                'Customize your experience',
                style: titleStyle,
              ),
              Gaps.v16,
              const Text(
                'Track where you see Twitter content across the web',
                style: subTitleStyle,
              ),
              Gaps.v16,
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: true,
                onChanged: (value) => {},
                title: const Text(
                  'Twitter uses this data to personalize your experience. This web browsing history will nerver be stored with your name, email, or phone number.',
                  style: labelStyle,
                ),
              ),
              Gaps.v20,
              const Text(
                'By signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more',
              ),
              const Spacer(),
              const WideButton(
                text: 'Next',
                isDark: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
