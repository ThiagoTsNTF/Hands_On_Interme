import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ElevatedButtonThemeData get primaryButton => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      textStyle: TextStyles.i.bold.copyWith(fontSize: ScreenUtil().setSp(16)),
      disabledBackgroundColor: AppColors.i.primary,
      backgroundColor: AppColors.i.primary,
      foregroundColor: Colors.white,
      padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(12),
        ScreenUtil().setHeight(18),
        ScreenUtil().setWidth(12),
        ScreenUtil().setHeight(18),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
      ),
    ),
  );

  ElevatedButtonThemeData get hollowButton => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(20),
        ScreenUtil().setHeight(16),
        ScreenUtil().setWidth(20),
        ScreenUtil().setHeight(16),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
      ),
      side: BorderSide(
        color: AppColors.i.inputBorder,
        width: ScreenUtil().setWidth(1),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      disabledBackgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      foregroundColor: AppColors.i.hollowButtonForeground,
      disabledForegroundColor: AppColors.i.hollowButtonForeground,
    ),
  );

  InputDecoration get defaultInputDecoration => InputDecoration(
    errorMaxLines: 3,
    filled: true,
    fillColor: Color(0xFFF1F1F1),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
    ),
    contentPadding: EdgeInsets.all(18.r),
    floatingLabelStyle: TextStyles.i.medium.copyWith(
      color: Color(0xff6A707C),
      fontSize: ScreenUtil().setSp(16),
    ),
    labelStyle: TextStyles.i.medium.copyWith(
      color: Color(0xff6A707C),
      fontSize: ScreenUtil().setSp(14),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
      borderSide: BorderSide(width: 2.w, color: AppColors.i.primary),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
      borderSide: BorderSide(width: 2.w, color: Color(0xFFF13518)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
      borderSide: BorderSide(width: 1.w, color: Color(0xFFF13518)),
    ),
    hintStyle: TextStyles.i.medium.copyWith(fontSize: ScreenUtil().setSp(14)),
  );
}

extension AppStylesExtension on BuildContext {
  AppStyles get styles => AppStyles.i;
}
