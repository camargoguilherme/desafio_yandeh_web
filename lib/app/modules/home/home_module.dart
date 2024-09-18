import 'package:flutter_modular/flutter_modular.dart';

import './home_screen_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomeScreenPage());
  }
}
