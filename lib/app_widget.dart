import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/themes/theme_base.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TCG League',
      theme: ThemeBase.themeData,
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
