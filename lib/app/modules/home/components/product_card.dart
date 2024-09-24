import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/components/image_app.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool showTomate;
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');

  ProductCard({super.key, required this.product, this.showTomate = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      height: 450,
      child: Card(
        semanticContainer: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  ImageApp(
                    showTomate
                        ? AppImages.tomateAppWeb
                        : AppImages.bandejaVagemAppWeb,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    right: 0,
                    top: 8,
                    child: CircleAvatar(
                      backgroundColor: AppColors.orange,
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          // Ação ao clicar no botão de adicionar
                        },
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    formatCurrency.format(
                      double.parse(product.price),
                    ), // Exibindo o preço
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPriceColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name, // Nome do produto
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${product.unitContent} ${product.unitMessure}', // Conteúdo e unidade
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.ean, // Código EAN
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    'Caixa c/ ${product.packageQuantity} ${product.package}', // Quantidade por caixa
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Yandeh', // Categoria
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
