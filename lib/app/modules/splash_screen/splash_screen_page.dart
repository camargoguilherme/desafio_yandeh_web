// lib/pages/splash_screen/splash_screen_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:math' as math;

import '../../core/components/image_app.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';
import './components/cart_painters.dart';

class SplashScreenPage extends StatefulWidget {
  static String routeName = '/';
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _cartLinesController;
  late AnimationController _cartTopController;
  late AnimationController _wheel1Controller;
  late AnimationController _wheel2Controller;
  late AnimationController _wheelStrokeController;

  late Animation<double> _logoAnimation;
  late Animation<double> _cartLinesAnimation;
  late Animation<double> _cartTopAnimation;
  late Animation<double> _wheel1Animation;
  late Animation<double> _wheel2Animation;
  late Animation<double> _wheel1StrokeAnimation;
  late Animation<double> _wheel2StrokeAnimation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // 1. Animação de rotação da Logo
    _logoController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _logoAnimation =
        Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_logoController);

    // 2. Animação da opacidade das linhas do carrinho
    _cartLinesController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 850),
    )..repeat(reverse: false);
    _cartLinesAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cartLinesController,
        curve: Interval(0.08, 0.92, curve: Curves.easeInOut),
      ),
    );

    // 3. Animação Stroke-Dashoffset do topo do carrinho
    _cartTopController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    _cartTopAnimation = Tween<double>(begin: 300.0, end: -320.0).animate(
      // Ajuste para [0, 30]
      CurvedAnimation(
        parent: _cartTopController,
        curve: Curves.linear,
      ),
    );

    // 4. Animação da rotação da roda esquerda (sentido horário)
    _wheel1Controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    _wheel1Animation =
        Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_wheel1Controller);

    // 5. Animação da rotação da roda direita (sentido anti-horário)
    _wheel2Controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    _wheel2Animation =
        Tween<double>(begin: 0.0, end: -2 * math.pi).animate(_wheel2Controller);

    // 6. Animação do curso da roda e do desalinhamento
    _wheelStrokeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();

    // 6.1 Animação do curso da roda esquerda
    _wheel1StrokeAnimation = Tween<double>(begin: 90.25, end: -120.75).animate(
      CurvedAnimation(
        parent: _wheelStrokeController,
        curve: Curves.linear,
      ),
    );

    // 6.2 Animação do curso da roda direita
    _wheel2StrokeAnimation = Tween<double>(begin: 120.25, end: -90.75).animate(
      CurvedAnimation(
        parent: _wheelStrokeController,
        curve: Curves.linear,
      ),
    );

    // Navegar para a próxima tela após 5 segundos
    Future.delayed(Duration(seconds: 5), () {
      // Direciona usuário para tela home
      //TODO: Implementar a navegação para a tela de login como BONUS
      Modular.to.pushReplacementNamed('/home');
    });

    super.initState();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _cartLinesController.dispose();
    _cartTopController.dispose();
    _wheel1Controller.dispose();
    _wheel2Controller.dispose();
    _wheelStrokeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = AppColors.splashScreenBackgroundColor;
    final textColor = AppColors.title;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rotating Logo
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _logoAnimation.value,
                  child: child,
                );
              },
              child: ImageApp(
                AppImages.logoLoading,
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 30),
            // Animated Cart
            Stack(
              alignment: Alignment.center,
              children: [
                // 1. Cart Track
                CustomPaint(
                  size: Size(150, 150),
                  painter: CartTrackPainter(
                    color: AppColors.lightOrange,
                  ),
                ),
                // 2. Cart Lines with Opacity Animation
                AnimatedBuilder(
                  animation: _cartLinesAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _cartLinesAnimation.value,
                      child: child,
                    );
                  },
                  child: CustomPaint(
                    size: Size(150, 150),
                    painter: CartLinesPainter(
                      color: AppColors.lightOrange,
                    ),
                  ),
                ),
                // 3. Cart Top with Stroke-Dashoffset Animation
                AnimatedBuilder(
                  animation: _cartTopAnimation,
                  builder: (context, child) {
                    return CustomPaint(
                      size: Size(150, 150),
                      painter: CartTopPainter(
                        strokeDashOffset: _cartTopAnimation.value,
                        color: AppColors.orange,
                      ),
                    );
                  },
                ),
                // 4. Wheel 1 with Rotation Animation
                Positioned(
                  left: 35,
                  top: 110,
                  child: AnimatedBuilder(
                    animation: _wheel1Animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _wheel1Animation.value,
                        child: child,
                      );
                    },
                    child: CustomPaint(
                      size: Size(30, 30),
                      painter: CartWheelPainter(),
                    ),
                  ),
                ),
                // 5. Wheel 2 with Rotation Animation
                Positioned(
                  left: 110,
                  top: 110,
                  child: AnimatedBuilder(
                    animation: _wheel2Animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _wheel2Animation.value,
                        child: child,
                      );
                    },
                    child: CustomPaint(
                      size: Size(30, 30),
                      painter: CartWheelPainter(),
                    ),
                  ),
                ),
                // 6. Wheel Stroke Animation for Wheel 1
                Positioned(
                  left: 35,
                  top: 110,
                  child: AnimatedBuilder(
                    animation: _wheel1StrokeAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(30, 30),
                        painter: CartWheelStrokePainter(
                          strokeDashOffset: _wheel1StrokeAnimation.value,
                          color: AppColors.orange,
                        ),
                      );
                    },
                  ),
                ),
                // 7. Wheel Stroke Animation for Wheel 2
                Positioned(
                  left: 110,
                  top: 110,
                  child: AnimatedBuilder(
                    animation: _wheel2StrokeAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(30, 30),
                        painter: CartWheelStrokePainter(
                          strokeDashOffset: _wheel2StrokeAnimation.value,
                          color: AppColors.orange,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
