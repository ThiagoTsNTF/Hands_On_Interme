import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleepguard_app/modules/home/models/environment_model.dart';

import 'dashboard_tile.dart';

class Dashboard extends StatelessWidget {
  final EnvironmentModel? environments;

  const Dashboard({super.key, required this.environments});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 140.h,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
      ),
      children: [
        DashboardTile(
          title: "Umidade",
          value: "${environments?.humidity.toString()} pg/mL" ?? "",
          icon: Icons.water,
          color: Color(0xFF0066FF),
          textColor: Colors.white,
        ),
        DashboardTile(
          title: "Movimento",
          value: (environments?.moviment ?? false) ? "Sim" : "Não",
          icon: Icons.wind_power,
          color: Color(0xFF242424),
          textColor: Colors.white,
        ),
        DashboardTile(
          title: "Temperatura",
          value: "${environments?.temperature.toString()} °C" ?? "",
          icon: Icons.thermostat,
          color: Color(0xFFECECEC),
          textColor: Colors.black,
        ),
        DashboardTile(
          title: "Posição",
          value:
              "${environments?.position.x}, ${environments?.position.y}, ${environments?.position.z}",
          icon: Icons.water,
          color: Color(0xFFD6E4FD),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
