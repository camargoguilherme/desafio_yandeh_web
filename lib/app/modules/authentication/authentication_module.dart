import 'package:flutter_modular/flutter_modular.dart';

import 'authentication_screen_page.dart';

class AuthenticationModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute,
        child: (_) => const AuthenticationScreenPage());
  }
}
