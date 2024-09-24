import 'package:desafio_yandeh_web/app/modules/home/components/product_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:convert';

import '../../core/utils/responsive_layout.dart';
import './components/product_carousel.dart';
import './models/section_model.dart';
import './services/product_service.dart';

class HomeScreenPage extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreenPage({super.key});
  @override
  State<HomeScreenPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  final ScrollController _scrollController = ScrollController();
  late final ProductService _productsServices = Modular.get<ProductService>();
  List<SectionModel> _sections = [];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // loadProducts();
    loadProductsAsync();
    super.initState();
  }

  // Fetch content from the json file
  Future<dynamic> readJson() async {
    final String response =
        await rootBundle.loadString('assets/sections-with-products.json');
    final data = await json.decode(response);
    return data;
  }

  Future<void> loadProducts() async {
    final response = await _productsServices.getProducts();
    setState(() {
      _sections = response.data ?? [];
    });
  }

  Future<void> loadProductsAsync() async {
    final data = await readJson();
    Future.delayed(
      const Duration(seconds: 0),
      () => setState(() {
        _sections = data['sections'] != null
            ? (data['sections'] as List)
                .map((i) => SectionModel.fromJson(i))
                .toList()
            : [];
      }),
    );
  }

  Widget _getWidgetBySection(SectionModel section, bool isPhone) {
    if (section.section == 'Preferidos' || section.section == 'Hortifruti')
      return ProductBanner(section: section);
    return ProductCarousel(
      section: section,
      isPhone: isPhone,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPhone = ResponsiveLayout.isPhone(context);

    return Scaffold(
      body: SizedBox(
        height: ResponsiveLayout.screenHeight(context),
        width: ResponsiveLayout.screenWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isPhone ? 0 : 40),
          child: Center(
            child: _sections.isEmpty
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: _sections.map((section) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: section.products.isNotEmpty ? 120 : 15),
                          child: _getWidgetBySection(section, isPhone),
                        );
                      }).toList(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
