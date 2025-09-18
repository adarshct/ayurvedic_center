import 'package:ayurvedic_center/core/constants/routes.dart';
import 'package:ayurvedic_center/core/utils/app_router.dart';
import 'package:ayurvedic_center/features/home/presentation/pages/home_screen.dart';
import 'package:ayurvedic_center/features/login/presentation/pages/login_screen.dart';
import 'package:ayurvedic_center/features/register/presentation/pages/register_screen.dart';
import 'package:ayurvedic_center/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navigatorKey,
      theme: ThemeData(fontFamily: 'Poppins'),
      builder: (context, child) {
        return SafeArea(bottom: true, top: false, child: child!);
      },
      routes: {
        Routes.splash: (_) => const SplashScreen(),
        Routes.login: (_) => const LoginScreen(),
        Routes.home: (_) => const HomeScreen(),
        Routes.register: (_) => const RegisterScreen(),
      },
      initialRoute: Routes.splash,
    );
  }
}
