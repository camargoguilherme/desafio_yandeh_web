import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/responsive_layout.dart';
import './components/product_card.dart';
import './models/product_model.dart';
import 'services/product_service.dart';
import './models/section_model.dart';

class HomeScreenPage extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreenPage({super.key});
  @override
  State<HomeScreenPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  late final ProductService _productsServices = Modular.get<ProductService>();
  List<SectionModel> _sections = [];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    loadProducts();
    super.initState();
  }

  loadProducts() async {
    final response = await _productsServices.getProducts();
    setState(() {
      _sections = response.data ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ResponsiveLayout.screenHeight(context),
        width: ResponsiveLayout.screenWidth(context),
        child: Flex(
          direction: ResponsiveLayout.isLargerDesktop(context) ||
                  ResponsiveLayout.isExtraLargerDesktop(context)
              ? Axis.horizontal
              : Axis.vertical,
          children: [
            Center(
              child: _sections.isEmpty
                  ? const CircularProgressIndicator()
                  : ProductCard(product: _sections.first.products.first),
            ),
          ],
        ),
      ),
    );
  }
}
