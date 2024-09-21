import './product_model.dart';

class SectionModel {
  String section;
  String description;
  List<ProductModel> products;

  SectionModel({
    required this.section,
    required this.description,
    List<ProductModel>? products,
  }) : products = products ?? List<ProductModel>.empty(growable: true);

  SectionModel.fromJson(Map<String, dynamic> json)
      : section = json['section'],
        description = json['description'],
        products = (json['products'] as List).isNotEmpty
            ? (json['products'] as List)
                .map((i) => ProductModel.fromJson(i))
                .toList()
            : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['section'] = section;
    data['description'] = description;
    data['products'] = products.map((i) => i.toJson());

    return data;
  }
}
