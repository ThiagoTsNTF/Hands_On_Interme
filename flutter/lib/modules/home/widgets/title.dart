import 'package:flutter/material.dart';
import 'package:sleepguard_app/core/ui/theme/extensions/size_screen_extension.dart';
import 'package:sleepguard_app/core/ui/theme/theme/styles/text_styles.dart';

class TitleComponent extends StatelessWidget {
  final Color iconColor;
  final String title;
  final IconData icon;

  const TitleComponent({
    super.key,
    required this.iconColor,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28, color: iconColor),
        SizedBox(width: 8.w),
        Text(title, style: context.textStyles.semiBold16),
      ],
    );
  }
}
