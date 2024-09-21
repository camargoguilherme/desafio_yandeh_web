import 'package:flutter_modular/flutter_modular.dart';

import '../../core/network/interfaces/i_http_client.dart';
import './services/product_service.dart';
import './home_screen_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomeScreenPage());
  }
}
