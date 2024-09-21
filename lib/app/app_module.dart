import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './core/network/custom_dio/custom_dio.dart';
import './core/network/interfaces/i_http_client.dart';
import './core/constants.dart' as consts;
import './modules/authentication/authentication_module.dart';
import './modules/home/home_module.dart';
import './modules/home/services/product_service.dart';
import './modules/splash_screen/splash_screen_module.dart';

class AppModule extends Module {
  final bool showDebbugBanner;
  AppModule({this.showDebbugBanner = true});

  @override
  void binds(Injector i) {
    i.addLazySingleton<Dio>(() => Dio());
    i.addLazySingleton<IHttpClient>(() => CustomDio(
        i<Dio>(), consts.Settings.baseUrl,
        token: consts.Settings.token));
    i.addLazySingleton<ProductService>(
        () => ProductService(i.get<IHttpClient>()));
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/login/', module: AuthenticationModule());
    r.module('/home/', module: HomeModule());
  }
}
