import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/contants/gaps.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';
import 'package:flutter_nomad_study_v2/main.dart';

class WideButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final bool isDark;

  const WideButton({
    super.key,
    this.imagePath,
    required this.text,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size32),
        border: Border.all(color: isDark ? Colors.black : grey300),
        color: isDark ? Colors.black : null,
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
                color: isDark ? Colors.white : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
