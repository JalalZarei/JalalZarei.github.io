import 'package:get/get.dart';
import 'package:test_contacts/home/home_page_binding.dart';
import 'package:test_contacts/home/view.dart';
import 'package:test_contacts/pages/route_names.dart';

class RoutePages {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: RouteNames.initialRoute,
      page: HomePage.new,
      binding: HomePageBinding(),
    )
  ];
}
