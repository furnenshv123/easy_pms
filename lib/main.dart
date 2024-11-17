import 'package:easy_pms/config/router/router.dart';
import 'package:easy_pms/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      
      routerConfig: router.config(),
    );
  }
}
