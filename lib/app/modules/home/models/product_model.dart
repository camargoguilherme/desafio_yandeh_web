class ProductModel {
  int id;
  String name;
  String sku;
  String category;
  String? unitType;
  String package;
  String ean;
  double unitContent;
  String? unitMessure;
  int packageQuantity;
  String price;

  ProductModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    this.unitType,
    required this.package,
    required this.ean,
    required this.unitContent,
    this.unitMessure,
    required this.packageQuantity,
    required this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        sku = json['sku'],
        category = json['category'],
        unitType = json['unitType'] ?? '',
        package = json['package'],
        ean = json['ean'],
        unitContent = double.parse(json['unitContent'].toString()),
        unitMessure = json['unitMessure'] ?? '',
        packageQuantity = int.parse(json['packageQuantity'].toString()),
        price = json['price'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['sku'] = sku;
    data['category'] = category;
    data['unitType'] = unitType;
    data['package'] = package;
    data['ean'] = ean;
    data['unitContent'] = unitContent;
    data['unitMessure'] = unitMessure;
    data['packageQuantity'] = packageQuantity;
    data['price'] = price;

    return data;
  }
}
