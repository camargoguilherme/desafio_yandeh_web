import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/components/image_app.dart';
import '../../core/styles/app_images.dart';
import '../../core/utils/responsive_layout.dart';

class HomeScreenPage extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreenPage({super.key});
  @override
  State<HomeScreenPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
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
            children: const [],
          )),
    );
  }
}
