import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/character/view/character_view.dart';
import '../../features/character/view/details_character_view.dart';

class AppRoutes {
  static String get initialRoute => '/';

  static List<GetPage> get pages => [
    GetPage(name: '/', page: () => CharacterView()),
    GetPage(name: '/details', page: () => const DetailsCharacterView()),
  ];
}
