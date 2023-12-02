import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_interests01_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/widgets/wide_button.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterPasswordScreen extends StatefulWidget {
  const TwitterPasswordScreen({
    super.key,
  });

  @override
  State<TwitterPasswordScreen> createState() => _TwitterPasswordScreenState();
}

class _TwitterPasswordScreenState extends State<TwitterPasswordScreen> {
  late final TextEditingController _controller = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  void _onNextTap(BuildContext context) {
    if (_controller.text.length >= 8) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TwitterInterests01Screen(),
        ),
      );
    }
  }

  void _toggleObscure() {
    _obscureText = !_obscureText;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'You\'ll need a password',
                style: titleStyle,
              ),
              Gaps.v16,
              const Text(
                'Make sure it\'s 8 characters or more.',
              ),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: _toggleObscure,
                        icon: _obscureText
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      if (_controller.text.length >= 8)
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),
              Gaps.v20,
              const Spacer(),
              GestureDetector(
                onTap: () => _onNextTap(context),
                child: const WideButton(
                  'Next',
                  isDark: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
