import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/config/router/router.dart';
import 'package:easy_pms/config/themes/app_theme.dart';
import 'package:easy_pms/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await initializeDependencies();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const EasyPMS());

}

class EasyPMS extends StatelessWidget {
   const EasyPMS({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      
      routerConfig: router.config(),
    );
  }
}
