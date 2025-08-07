import 'package:fteam_challenge/app/domain/core/failures/failures.dart';
import 'package:fteam_challenge/app/domain/usecases/use_case_impl.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/character_entity.dart';

class CharacterViewModel extends GetxController {
  final UseCaseImpl useCaseImpl;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final initial = 1.obs;
  final charactersLits = <CharacterEntity>[].obs;

  CharacterViewModel({required this.useCaseImpl});

  Future<void> fethCharacters() async {
    isLoading.value = true;
    isLoadingMore.value = true;

    final result = await useCaseImpl.fetchResults(
      'character?page=${initial.value}',
    );
    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          Get.defaultDialog(
            title: 'Erro no servidor!',
            middleText: failure.message,
          );
        }
        if (failure is NotFoundFailure) {
          //Case de algum erro na busca dos dados paginados isLoading.value = false;
          isLoadingMore.value = false;
        }
        if (failure is UnknownFailure) {
          Get.defaultDialog(
            title: 'Erro desconhecido!',
            middleText: failure.message,
          );
        }
      },
      (results) {
        for (var i = 0; i < results.length; i++) {
          charactersLits.add(results[i]);
        }
      },
    );
    isLoading.value = false;
  }
}
