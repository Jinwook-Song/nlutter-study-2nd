import 'package:flutter/cupertino.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthContorller = TextEditingController();
  final FocusNode _birthFocus = FocusNode();

  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _isValid = _checkValid();
      });
    });
    _emailController.addListener(() {
      setState(() {
        _isValid = _checkValid();
      });
    });
    _birthContorller.addListener(() {
      setState(() {
        _isValid = _checkValid();
      });
    });
    _birthFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthContorller.dispose();
    _birthFocus.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (!_isValid) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TwitterPolicyScreen(
          name: _nameController.text,
          email: _emailController.text,
          birth: _birthContorller.text,
        ),
      ),
    );
  }

  bool _checkValid() {
    return _nameController.text.length > 2 &&
        _emailController.text.contains('@') &&
        _birthContorller.text.length > 5;
  }

  void _onDateTimeChanged(DateTime date) {
    final dateToString = date.toString().split(' ')[0];
    _birthContorller.value = TextEditingValue(text: dateToString);
    setState(() {});
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
                      suffix: _nameController.text.length > 2
                          ? Container(
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
                            )
                          : null,
                    ),
                  ),
                  Gaps.v20,
                  TextField(
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
                      suffix: _emailController.text.contains('@')
                          ? Container(
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
                            )
                          : null,
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    readOnly: true,
                    controller: _birthContorller,
                    focusNode: _birthFocus,
                    style: const TextStyle(color: primaryColor),
                    decoration: const InputDecoration(
                      labelText: 'Date of birth',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey500),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
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
                      color: _isValid ? Colors.black : grey500,
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
      bottomNavigationBar: _birthFocus.hasFocus
          ? SizedBox(
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                maximumDate: DateTime.now(),
                onDateTimeChanged: _onDateTimeChanged,
              ),
            )
          : null,
    );
  }
}
