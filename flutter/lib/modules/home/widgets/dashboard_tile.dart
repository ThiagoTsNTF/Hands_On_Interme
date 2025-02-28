import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sleepguard_app/core/ui/theme/extensions/extensions.dart';
import 'package:sleepguard_app/core/ui/theme/theme/styles/text_styles.dart';

class DashboardTile extends StatelessWidget {
  final String? title;
  final String? value;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  const DashboardTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? "",
                  style: context.textStyles.bold.copyWith(
                    fontSize: 12.sp,
                    color: textColor,
                  ),
                ),
                Text(
                  value ?? "",
                  style: context.textStyles.bold.copyWith(
                    fontSize: 22.sp,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: 41.r,
            height: 41.r,
            child: Center(child: SizedBox(height: 22.h, child: Icon(icon))),
          ),
        ],
      ),
    );
  }
}
