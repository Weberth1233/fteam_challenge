import 'package:flutter/material.dart';
import 'package:fteam_challenge/app/presentation/core/bindings/app_bindings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/presentation/core/routes/app_routes.dart';
import 'app/presentation/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initialRoute,
      theme: AppTheme.defaultTheme,
    );
  }
}
