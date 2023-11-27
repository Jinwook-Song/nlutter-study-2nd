import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_policy_screen.dart';
import 'package:flutter_nomad_study_v2/contants/gaps.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterSignUpScreen extends StatefulWidget {
  const TwitterSignUpScreen({super.key});

  @override
  State<TwitterSignUpScreen> createState() => _TwitterSignUpScreenState();
}

class _TwitterSignUpScreenState extends State<TwitterSignUpScreen> {
  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TwitterPolicyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Sizes.size80,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Padding(
            padding: EdgeInsets.only(left: Sizes.size16),
            child: Row(children: [Text('Cancel')]),
          ),
        ),
        title: Image.asset(
          'assets/images/twitter_logo.png',
          width: Sizes.size32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
          vertical: Sizes.size16,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create your account',
                    style: titleStyle,
                  ),
                  Gaps.v20,
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: grey500),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone number or email address',
                      hintStyle: TextStyle(color: grey500),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Date of birth',
                      hintStyle: TextStyle(color: grey500),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _onNextTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size32),
                      color: grey500,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: grey300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
