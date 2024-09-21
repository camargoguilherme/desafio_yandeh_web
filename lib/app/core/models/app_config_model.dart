class AppConfigModel {
  int? id;
  String? name;
  String? primaryColor;
  String? appBarColor;
  String? textAppBarColor;
  String? splashScreenBackgroundColor;
  String? successColor;
  String? errorColor;
  String? white;
  String? lightWhite;
  String? yellow;
  String? grey;
  String? red;
  String? orange;
  String? lightOrange;
  String? title;
  String? black;

  List<ImageList>? imageList;

  AppConfigModel({
    this.id,
    this.name,
    this.primaryColor,
    this.appBarColor,
    this.textAppBarColor,
    this.splashScreenBackgroundColor,
    this.successColor,
    this.errorColor,
    this.white,
    this.lightWhite,
    this.yellow,
    this.grey,
    this.red,
    this.orange,
    this.lightOrange,
    this.title,
    this.black,
  });

  AppConfigModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    primaryColor = json['primaryColor'];
    appBarColor = json['appBarColor'];
    textAppBarColor = json['textAppBarColor'];
    splashScreenBackgroundColor = json['splashScreenBackgroundColor'];
    successColor = json['successColor'];
    errorColor = json['errorColor'];
    white = json['white'];
    lightWhite = json['lightWhite'];
    yellow = json['yellow'];
    grey = json['grey'];
    red = json['red'];
    orange = json['orange'];
    lightOrange = json['lightOrange'];
    title = json['title'];
    black = json['black'];

    if (json['imageList'] != null) {
      imageList = <ImageList>[];
      json['imageList'].forEach((v) {
        imageList!.add(ImageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['primaryColor'] = primaryColor;
    data['appBarColor'] = appBarColor;
    data['textAppBarColor'] = textAppBarColor;
    data['splashScreenBackgroundColor'] = splashScreenBackgroundColor;
    data['successColor'] = successColor;
    data['errorColor'] = errorColor;
    data['white'] = white;
    data['lightWhite'] = lightWhite;
    data['yellow'] = yellow;
    data['grey'] = grey;
    data['red'] = red;
    data['orange'] = orange;
    data['lightOrange'] = lightOrange;
    data['title'] = title;
    data['black'] = black;

    if (imageList != null) {
      data['imageList'] = imageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageList {
  int? id;
  String? idImage;
  String? name;
  String? link;

  ImageList({this.id, this.idImage, this.name, this.link});

  ImageList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idImage = json['idImage'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idImage'] = idImage;
    data['name'] = name;
    data['link'] = link;
    return data;
  }
}
