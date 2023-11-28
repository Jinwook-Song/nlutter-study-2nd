import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/twitter_sign_up_screen.dart';
import 'package:flutter_nomad_study_v2/assignment/twitter/widgets/wide_button.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class TwitterHomeScreen extends StatelessWidget {
  const TwitterHomeScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TwitterSignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/twitter_logo.png',
          width: Sizes.size32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          Sizes.size32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'See what\'s happening\n in the world right now',
              style: titleStyle,
            ),
            const Spacer(),
            const WideButton(
              'Continue with Apple',
              imagePath: 'assets/images/apple_logo.png',
            ),
            Gaps.v16,
            const WideButton(
              'Continue with Google',
              imagePath: 'assets/images/google_logo.png',
            ),
            Gaps.v20,
            const Row(
              children: [
                Expanded(child: Divider()),
                Gaps.h8,
                Text('or'),
                Gaps.h8,
                Expanded(child: Divider()),
              ],
            ),
            Gaps.v8,
            GestureDetector(
              onTap: () => _onCreateAccountTap(context),
              child: const WideButton(
                'Create account',
                isDark: true,
              ),
            ),
            Gaps.v20,
            const Text(
              'By signing up, you agree to our Terms, Privacy Policy and, Cookie Use.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size16,
          ),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(text: 'Have an account already? '),
                TextSpan(text: 'Log in', style: TextStyle(color: primaryColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
