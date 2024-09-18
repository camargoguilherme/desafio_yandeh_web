import 'package:flutter_modular/flutter_modular.dart';

import 'modules/authentication/authentication_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  final bool showDebbugBanner;
  AppModule({this.showDebbugBanner = true});

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: AuthenticationModule());
    r.module('/home/', module: HomeModule());
  }
}
