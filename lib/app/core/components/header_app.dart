import 'package:desafio_yandeh_web/app/core/components/image_app.dart';
import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';

class HeaderApp extends StatelessWidget {
  final bool isPhone;
  final Function(String) onSearch;
  final TextEditingController controller = TextEditingController();

  HeaderApp({required this.isPhone, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(10),
            blurRadius: 10,
          ),
        ],
      ),
      child: isPhone ? _buildMobileHeader() : _buildDesktopHeader(context),
    );
  }

  // Header para Desktop
  Widget _buildDesktopHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo e barra de pesquisa
            Row(
              children: [
                ImageApp(
                  AppImages.yandehLogo,
                  height: 40,
                ), // Adapte o caminho da imagem Adapte o caminho da imagem
                SizedBox(width: 16),
                _buildSearchBar(),
              ],
            ),
            // Nome da loja e telefone
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Mercearia Dois Irmãos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '07.666.444/7773-29',
                      style: TextStyle(fontSize: 14, color: AppColors.grey),
                    ),
                  ],
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            // Botão de carrinho
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: AppColors.white),
              label: Text(
                'Carrinho',
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.menu, color: AppColors.textColor),
                    label: Text(
                      'Todas as Categorias',
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Campanhas',
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Frutas yandeh',
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Indústrias e marcas',
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Pedidos',
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Importação de pedidos',
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  // Header para Mobile
  Widget _buildMobileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Nome da loja e CNPJ
        Column(
          children: [
            Text(
              'Mercadinho Maristela',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '05.892.738/0001-24',
              style: TextStyle(fontSize: 14, color: AppColors.grey),
            ),
          ],
        ),
        SizedBox(height: 16),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFilterButton(
                'Todas categorias',
                AppColors.black,
                AppColors.white,
                AppColors.black,
              ),
              _buildFilterButton(
                'Campanhas',
                AppColors.black,
                AppColors.white,
                AppColors.black,
              ),
              _buildFilterButton(
                'Frutas Yandeh',
                AppColors.white,
                AppColors.textColor,
                AppColors.textColor,
              ),
              _buildFilterButton(
                'Indústrias e marcas',
                AppColors.black,
                AppColors.white,
                AppColors.black,
              ),
              _buildFilterButton(
                'Pedidos',
                AppColors.black,
                AppColors.white,
                AppColors.black,
              ),
              _buildFilterButton(
                'Importação de pedidos',
                AppColors.black,
                AppColors.white,
                AppColors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Barra de pesquisa
  Widget _buildSearchBar() {
    return Container(
      width: 300,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar produtos',
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
          IconButton(
              onPressed: () => onSearch(controller.text),
              icon: Icon(Icons.search, color: AppColors.grey)),
        ],
      ),
    );
  }

  // Botão de filtro (usado no mobile)
  Widget _buildFilterButton(
    String label,
    Color textColor,
    Color bgColor,
    Color borderColor,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label, style: TextStyle(color: textColor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor, width: 1),
          ),
        ),
      ),
    );
  }
}
