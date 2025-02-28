import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  //Primary
  // Color get primary => const Color(0xFF1C675F);
  // Color get primaryLight => const Color(0xff6c9995);
  // Color get primary100 => const Color(0xffcff3f2);
  // Color get primary200 => const Color(0xff6fb5b5);
  // Color get primary300 => const Color(0xff558c87);
  // Color get primary400 => const Color(0xFF417f7a);
  // Color get primary500 => const Color(0xFF1c675f);
  // Color get primary600 => const Color(0xff114c45);
  // Color get primary700 => const Color(0xff0f433c);

  Color get primary => const Color(0xFF0066FF);
  Color get primaryLight => const Color(0xFF3E89FF);
  Color get primary100 => const Color(0xFFD9EDF6);
  Color get primary200 => const Color(0xFF9CBFF5);

  List<Color> get primaryGradient => [Color(0xFF0066FF), Color(0xFF1D62CA)];

  // Secondary
  Color get secondary => const Color(0XFF1F2E3C);

  //Black
  Color get black => const Color(0xFF000000);
  Color get black2 => const Color(0xFF5A5757);
  Color get black3 => const Color(0xFFAEA8A8);
  Color get black4 => const Color(0XFFDBDBDB);

  //Auxiliary
  Color get important => const Color(0xFFFD7802);
  Color get warning => const Color(0xFFF13518);
  Color get success => const Color(0xFF2AB354);
  Color get extraInfo => const Color(0xFFE17608);
  Color get info => const Color(0xFF2F80ED);
  Color get cancel => const Color(0xFFFF7D7D);

  // Neutral
  Color get neutral => const Color(0xFF333333);
  Color get neutral2 => const Color(0xFF4F4F4F);
  Color get neutral3 => const Color(0xFF6C7278);
  Color get neutral4 => const Color(0xFF9EA7AD);
  Color get neutral5 => const Color(0xFFE1E8EA);
  Color get neutral6 => const Color(0xFF8A8A8A);
  Color get neutral7 => const Color(0XFFF3F5F5);
  Color get neutral8 => const Color(0XFF666666);
  Color get neutral9 => const Color(0XFFF3F3F3);

  //Custom
  Color get inputBorder => const Color(0xffE1E8EA);
  Color get buttonLabel => const Color(0xff9EA7AD);
  Color get dividerColor => const Color(0xFFAAABAB);

  Color get defaultBackgroundGrey => const Color(0xFFF2F2F2);
  Color get hollowButtonForeground => const Color(0XFF6C7278);
  Color get lightLabel => const Color(0XFF71727A);
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.i;
}
