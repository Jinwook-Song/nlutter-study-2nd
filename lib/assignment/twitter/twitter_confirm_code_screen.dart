import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_password_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/widgets/wide_button.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TwitterConfirmCodeScreen extends StatefulWidget {
  const TwitterConfirmCodeScreen({
    super.key,
  });

  @override
  State<TwitterConfirmCodeScreen> createState() =>
      _TwitterConfirmCodeScreenState();
}

class _TwitterConfirmCodeScreenState extends State<TwitterConfirmCodeScreen> {
  late final TextEditingController _controller = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  void _onNextTap(BuildContext context) {
    if (_controller.text.length == 6) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TwitterPasswordScreen(),
        ),
      );
    }
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
                'We sent you a code',
                style: titleStyle,
              ),
              Gaps.v16,
              const Text(
                'Enter it below to verify\njhon.mobbin@gmail.com',
              ),
              Gaps.v20,
              PinCodeTextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                pinTheme: PinTheme(
                  inactiveColor: Colors.grey.shade500,
                  selectedColor: Colors.black,
                  activeColor: Colors.black,
                ),
              ),
              Gaps.v12,
              if (_controller.text.length == 6)
                const Center(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 36,
                  ),
                ),
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
