import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleepguard_app/core/ui/theme/theme/extensions/extensions.dart';
import 'package:sleepguard_app/core/ui/theme/theme/styles/text_styles.dart';

class AlertTile extends StatelessWidget {
  final String? dateTime;
  final String? message;
  const AlertTile({super.key, this.dateTime, this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Container(
          width: 8.r,
          height: 8.r,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dateTime != null)
              Text(
                DateFormat(
                  "HH:mm - dd/MM/yyyy",
                ).format(DateTime.parse(dateTime!)),
                style: context.textStyles.semiBold.copyWith(fontSize: 12.sp),
              ),
            Text(
              message ?? "",
              style: context.textStyles.regular.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }
}
