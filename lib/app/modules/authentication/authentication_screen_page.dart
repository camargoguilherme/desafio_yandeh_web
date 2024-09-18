import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/components/image_app.dart';
import '../../core/styles/app_images.dart';
import '../../core/utils/responsive_layout.dart';

class AuthenticationScreenPage extends StatefulWidget {
  static String routeName = '/';
  const AuthenticationScreenPage({super.key});
  @override
  State<AuthenticationScreenPage> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreenPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: ResponsiveLayout.screenHeight(context),
          width: ResponsiveLayout.screenWidth(context),
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color(0xFF000000).withOpacity(0.5), BlendMode.darken),
            image: ImageApp(AppImages.backgroundAppWeb).provider(),
          )),
          child: Flex(
            direction: ResponsiveLayout.isLargerDesktop(context) ||
                    ResponsiveLayout.isExtraLargerDesktop(context)
                ? Axis.horizontal
                : Axis.vertical,
            children: const [],
          )),
    );
  }
}
