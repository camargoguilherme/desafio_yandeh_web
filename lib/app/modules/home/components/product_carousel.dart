import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/utils/responsive_layout.dart';
import '../../home/components/product_card.dart';
import '../models/section_model.dart';

class ProductCarousel extends StatefulWidget {
  final SectionModel section;
  final bool isPhone;

  ProductCarousel({
    super.key,
    required this.section,
    this.isPhone = false,
  });

  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final ScrollController _scrollController = ScrollController();

  // Função para rolar a lista para a direita
  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Função para rolar a lista para a esquerda
  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Color _getBackgroundColorBySection(String section) {
    switch (section) {
      case 'Fracionados':
        return AppColors.fracionadosSection;
      case 'Promo':
        return AppColors.promoSection;
      case 'Preferidos':
        return AppColors.preferidosSection;
      case 'Descubra':
        return AppColors.descubraSection;
      case 'Frutas':
        return AppColors.frutasSection;
      case 'Hortifruti':
        return AppColors.hortifrutiSection;
      case 'Legumes':
        return AppColors.legumesSection;
      case 'Temperos':
        return AppColors.temperosSection;

      default:
        return AppColors.white;
    }
  }

  Widget _headerProductCarousel() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  widget.section.section,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                if (!widget.isPhone)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      widget.section.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
              ],
            ),
            if (!widget.isPhone)
              TextButton(
                onPressed: () {
                  // Ação ao clicar no botão "Ver todos os itens"
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: AppColors.textColor),
                    ),
                  ),
                ),
                child: Text(
                  'Ver ${widget.section.products.length} itens',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Altura do container principal
      margin: EdgeInsets.symmetric(
          horizontal: widget.isPhone ? 16.0 : 24.0, vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColorBySection(widget.section.section),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Permite que os filhos transbordem o Stack
        children: [
          // Cabeçalho da Seção
          _headerProductCarousel(),

          if (!widget.isPhone)
            Positioned(
              top: 180,
              left: -40,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Icon(Icons.arrow_back_ios, color: AppColors.textColor),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

          if (!widget.isPhone)
            Positioned(
              top: 180,
              right: -40,
              child: ElevatedButton.icon(
                onPressed: () {},
                label:
                    Icon(Icons.arrow_forward_ios, color: AppColors.textColor),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

          //ListView de produtos posicionado abaixo do cabeçalho
          Positioned(
            top: 200,
            right: 0,
            left: 0,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListView de produtos
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip
                        .none, // Permite que os itens transbordem o ListView
                    itemCount: widget.section.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: widget.isPhone
                            ? MediaQuery.of(context).size.width * 0.45
                            : MediaQuery.of(context).size.width * 0.2,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: OverflowBox(
                          maxHeight: double.infinity,
                          child: ProductCard(
                            product: widget.section.products[index],
                            showTomate: index % 2 == 0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
