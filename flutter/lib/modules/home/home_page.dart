import 'package:flutter/material.dart';
import 'package:sleepguard_app/core/ui/theme/extensions/extensions.dart';
import 'package:sleepguard_app/modules/home/widgets/alert_tile.dart';
import 'package:sleepguard_app/modules/home/widgets/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:sleepguard_app/modules/home/widgets/title.dart';

import '../../core/firebase/database.dart';
import 'home_controller.dart';
import 'models/environment_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleepguard')),
      body: Consumer<HomeController>(
        builder: (context, controller, child) {
          final environment = controller.environment;
          final alerts = controller.alerts;

          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchData();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  spacing: 16.h,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleComponent(
                      iconColor: Colors.blueAccent,
                      title: "Painel de monitoramento",
                      icon: Icons.dashboard,
                    ),
                    Dashboard(environments: environment),
                    TitleComponent(
                      iconColor: Colors.red,
                      title: "Alertas",
                      icon: Icons.warning,
                    ),
                    for (final alert in alerts ?? [])
                      AlertTile(dateTime: alert.hour, message: alert.message),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
