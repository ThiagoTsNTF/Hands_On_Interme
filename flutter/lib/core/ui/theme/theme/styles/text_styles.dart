import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get light => TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: ScreenUtil().setWidth(12),
    fontFamily: 'Poppins',
  );

  TextStyle get regular => TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setWidth(10),
    fontFamily: 'Poppins',
  );

  TextStyle get medium => TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setWidth(10),
    fontFamily: 'Poppins',
  );

  TextStyle get semiBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setWidth(12),
    fontFamily: 'Poppins',
  );

  TextStyle get semiBold16 => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setWidth(16),
    fontFamily: 'Poppins',
  );

  TextStyle get bold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: ScreenUtil().setWidth(16),
    fontFamily: 'Poppins',
  );

  TextStyle get extraBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: ScreenUtil().setWidth(32),
    fontFamily: 'Poppins',
  );

  TextStyle get black => TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: ScreenUtil().setWidth(32),
    fontFamily: 'Poppins',
  );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
