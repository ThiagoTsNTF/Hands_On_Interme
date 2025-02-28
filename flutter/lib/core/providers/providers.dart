import 'package:provider/provider.dart';
import 'package:sleepguard_app/core/core.dart';

class Providers {

  static get global => [
    Provider(
      create: (_) => FirebaseDatabaseProvider(),
    ),
  ];
}