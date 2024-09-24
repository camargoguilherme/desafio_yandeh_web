import '../models/app_config_model.dart';

class AppVideos {
  static String homeAppWeb = "assets/videos/home.mp4";
  static String queridinhosAppWeb = "assets/videos/queridinhos.mp4";
  static String hortifrutiAppWeb = "assets/videos/hortifruti.mp4";

  static void init(List<ImageList> images) {
    final map = _toMap();
    for (var img in images) {
      if (img.idImage == null || img.link == null) continue;
      map[img.idImage!] = img.link!;
    }
    _fromMap(map);
  }

  static void _fromMap(Map<String, String> map) {
    homeAppWeb = map['homeAppWeb'] ?? homeAppWeb;
    queridinhosAppWeb = map['queridinhosAppWeb'] ?? queridinhosAppWeb;
    hortifrutiAppWeb = map['hortifrutiAppWeb'] ?? hortifrutiAppWeb;
  }

  static Map<String, String> _toMap() {
    final Map<String, String> map = {};
    map['homeAppWeb'] = homeAppWeb;
    map['queridinhosAppWeb'] = queridinhosAppWeb;
    map['hortifrutiAppWeb'] = hortifrutiAppWeb;
    return map;
  }
}
