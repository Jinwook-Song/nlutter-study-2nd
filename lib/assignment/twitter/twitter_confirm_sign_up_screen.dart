import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_confirm_code_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/widgets/wide_button.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterConfirmSignUpScreen extends StatefulWidget {
  final String name, email, birth;
  const TwitterConfirmSignUpScreen({
    super.key,
    required this.name,
    required this.email,
    required this.birth,
  });

  @override
  State<TwitterConfirmSignUpScreen> createState() =>
      _TwitterConfirmSignUpScreenState();
}

class _TwitterConfirmSignUpScreenState
    extends State<TwitterConfirmSignUpScreen> {
  late final TextEditingController _nameController =
      TextEditingController(text: widget.name);
  late final TextEditingController _emailController =
      TextEditingController(text: widget.email);
  late final TextEditingController _birthContorller =
      TextEditingController(text: widget.birth);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthContorller.dispose();
    super.dispose();
  }

  void _onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TwitterConfirmCodeScreen(),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size16,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create your account',
                    style: titleStyle,
                  ),
                  Gaps.v20,
                  TextField(
                    readOnly: true,
                    controller: _nameController,
                    style: const TextStyle(color: primaryColor),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: grey700),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      suffix: Container(
                        padding: const EdgeInsets.all(Sizes.size3),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: Sizes.size16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    readOnly: true,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: primaryColor),
                    decoration: InputDecoration(
                      labelText: 'Phone number or email address',
                      labelStyle: const TextStyle(color: grey700),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      suffix: Container(
                        padding: const EdgeInsets.all(Sizes.size3),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: Sizes.size16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    readOnly: true,
                    controller: _birthContorller,
                    style: const TextStyle(color: primaryColor),
                    decoration: InputDecoration(
                      labelText: 'Date of birth',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      suffix: Container(
                        padding: const EdgeInsets.all(Sizes.size3),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: Sizes.size16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. Learn more. Others will be able to find you by email or phone number, when provided, unless you choose otherwise here.',
                  ),
                  Gaps.v16,
                  GestureDetector(
                    onTap: () => _onNextTap(context),
                    child: const WideButton(
                      'Sign up',
                      isBlue: true,
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
