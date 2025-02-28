import 'package:provider/provider.dart';

import '../../modules/home/home.dart';
import 'constants.dart';

class Pages {
  static get pages {
    return {
      Routes.home:
          (ctx) => ChangeNotifierProvider(
            create: (_) => HomeController(),
            child: const HomePage(),
          ),
    };
  }
}
