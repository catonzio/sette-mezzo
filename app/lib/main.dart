import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sette_e_mezzo/configs/pages.dart';
import 'package:sette_e_mezzo/configs/routes.dart';
import 'package:sette_e_mezzo/data/bindings/home_bindings.dart';
import 'package:sette_e_mezzo/ui/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      theme: ThemeData.dark(useMaterial3: true),
      defaultTransition: Transition.fade,
      initialBinding: HomeBindings(),
      getPages: AppPages.pages,
      home: const HomePage(),
    );
  }
}
