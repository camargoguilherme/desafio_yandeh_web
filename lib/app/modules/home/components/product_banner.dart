import 'package:flutter/material.dart';

import '../../../core/components/video_app.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_videos.dart';
import '../../../core/utils/responsive_layout.dart';
import '../models/section_model.dart';

class ProductBanner extends StatelessWidget {
  final SectionModel section;

  ProductBanner({Key? key, required this.section}) : super(key: key);

  Color _getColorBySection(String section) {
    switch (section) {
      case 'Preferidos':
        return AppColors.preferidosSection;
      case 'Hortifruti':
        return AppColors.hortifrutiSection;
      default:
        return AppColors.preferidosSection;
    }
  }

  String _getVideoBySection(String section) {
    switch (section) {
      case 'Preferidos':
        return AppVideos.queridinhosAppWeb;
      case 'Hortifruti':
        return AppVideos.hortifrutiAppWeb;
      default:
        return AppVideos.queridinhosAppWeb;
    }
  }

  String _getTextBySection(String section) {
    switch (section) {
      case 'Preferidos':
        return 'Queridinhos!';
      case 'Hortifruti':
        return 'Hortifruti Perfeito!';
      default:
        return 'Default Text';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: ResponsiveLayout.screenWidth(context) * 0.9,
        height: 225,
        child: Stack(
          children: [
            Positioned.fill(
              child: VideoApp(
                _getVideoBySection(section.section),
                width: ResponsiveLayout.screenWidth(context) * 0.9,
                height: 225,
                borderRadius:
                    BorderRadius.circular(20), // Pass the borderRadius
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              bottom: 16,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: _getColorBySection(section.section),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        _getTextBySection(section.section),
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        section.description,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Action when "Ver mais" is clicked
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColors.white),
                          ),
                        ),
                      ),
                      child: Text(
                        'Ver mais',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add more widgets here to overlay on the background if needed
          ],
        ),
      ),
    );
  }
}
