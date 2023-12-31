import 'package:get/get.dart';

import '../data/bindings/home_bindings.dart';
import '../ui/pages/home_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBindings())
  ];
}
