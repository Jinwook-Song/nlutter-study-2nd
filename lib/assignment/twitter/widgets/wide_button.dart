import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class WideButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final bool isDark;
  final bool isBlue;

  const WideButton(
    this.text, {
    super.key,
    this.imagePath,
    this.isDark = false,
    this.isBlue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size32),
        border: Border.all(
          color: isBlue
              ? primaryColor
              : isDark
                  ? Colors.black
                  : grey300,
        ),
        color: isBlue
            ? primaryColor
            : isDark
                ? Colors.black
                : null,
      ),
      child: SizedBox(
        height: Sizes.size32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              Image.asset(
                imagePath!,
                width: Sizes.size32,
                height: Sizes.size32,
              ),
              Gaps.h8,
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: (isDark || isBlue) ? Colors.white : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
