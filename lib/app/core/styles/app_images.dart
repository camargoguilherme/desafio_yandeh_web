import '../models/app_config_model.dart';

class AppImages {
  static String logoApp = "assets/images/logo-app.png";
  static String logoLoading = "assets/images/logo-loading.png";
  static String backgroundAppWeb = "assets/images/background-app-web.png";
  static String cartAppWeb = "assets/svgs/cart.svg";

  static void init(List<ImageList> images) {
    final map = _toMap();
    for (var img in images) {
      if (img.idImage == null || img.link == null) continue;
      map[img.idImage!] = img.link!;
    }
    _fromMap(map);
  }

  static void _fromMap(Map<String, String> map) {
    logoApp = map['logoApp'] ?? logoApp;
    backgroundAppWeb = map['backgroundAppWeb'] ?? backgroundAppWeb;
  }

  static Map<String, String> _toMap() {
    final Map<String, String> map = {};
    map['logoApp'] = logoApp;
    map['backgroundAppWeb'] = backgroundAppWeb;
    return map;
  }
}
