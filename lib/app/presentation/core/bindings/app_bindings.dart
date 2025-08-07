import 'package:fteam_challenge/app/infra/datasources/data_sources_impl.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

import '../../../domain/usecases/use_case_impl.dart';
import '../../../infra/repositories/repository_impl.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DataSourcesImpl(client: http.Client()));
    Get.put(RepositoryImpl(dataSource: Get.find<DataSourcesImpl>()));
    Get.put(UseCaseImpl(repository: Get.find<RepositoryImpl>()));

    // Get.put(PokemonClient());
    // Get.put(PokemonRepositoryImpl(Get.find<PokemonClient>()));
  }
}
